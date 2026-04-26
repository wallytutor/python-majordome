#!/usr/bin/env bash

# build.sh
# Linux Bash equivalent of build.ps1 for project management tasks.
#
# Design goals:
# - Keep behavior aligned with build.ps1.
# - Keep flags and execution order consistent.
# - Keep implementation readable and maintainable.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH_CORE="${SCRIPT_DIR}/bindings/rust/Cargo.toml"

# Keep same install marker convention as the PowerShell script.
export MAJORDOME_INSTALL="${SCRIPT_DIR}[full]"
export QUARTO_PYTHON=""

# Fallback to copy (avoid warning in WSL):
export UV_LINK_MODE=copy

# -----------------------------
# Flag Defaults
# -----------------------------
FLAG_RELEASE=0
FLAG_BACKTRACE=0
RUST_CHECK=0
RUST_CORE=0
TEST_RUST=0
TEST_PYTHON=0
FROM_PIP=0
PACKAGE_DIST=0

PACKAGE_DOCS=0
FRESH_DOCS=0
DOCS_PDF=0
PUBLISH_DOCS=0

CLEAN=0
DIST_CLEAN=0

HELP=0
DUMMY=0

PYTHON_ENV=""

# Track which parameter-set style group is being used so we can mimic
# PowerShell ParameterSetName behavior.
PARAM_SET=""

# Python environment fields populated during activation.
PYENV_NAME=""
PYENV_VERSION=""
PYENV_PATH=""
PYTHON_EXE=""

# -----------------------------
# Utilities
# -----------------------------

usage() {
    cat <<'EOF'
Usage:
  ./build.sh [flags]

Build flags:
  --release, -FlagRelease
  --backtrace, -FlagBacktrace
  --rust-check, -RustCheck
  --rust-core, -RustCore
  --test-rust, -TestRust
  --test-python, -TestPython
  --from-pip, -FromPip
  --package-dist, -PackageDist          (requires --from-pip)

Documentation flags:
  --package-docs, -PackageDocs
  --fresh-docs, -FreshDocs              (requires --package-docs)
  --docs-pdf, -DocsPdf                  (requires --package-docs)
  --publish-docs, -PublishDocs

Clean flags:
  --clean, -Clean
  --dist-clean, -DistClean

Misc flags:
  --dummy, -Dummy
  --python-env <py312|py313|py314>, -PythonEnv <...>
  --help, -Help

Notes:
  - Parameter-set style compatibility is preserved:
    Build flags can be combined with other Build flags.
    Doc flags are grouped under --package-docs.
    --publish-docs, clean flags, and --help are standalone groups.
  - If Python is required by selected action, --python-env is mandatory.
EOF
}

remove_hard() {
    local path="$1"
    rm -rf -- "$path" 2>/dev/null || true
}

test_tool_status() {
    local tool_name="$1"
    local result="$2"

    if [[ -n "$result" ]]; then
        printf '%s found: %s\n' "$tool_name" "$result"
    else
        printf '%s not found! Please install %s...\n' "$tool_name" "$tool_name"
        exit 1
    fi
}

ensure_clean_git_for_package_dist() {
    local status_output
    if ! status_output="$(git status --porcelain 2>/dev/null)"; then
        printf 'WARNING: Could not determine git status. Aborting --package-dist for safety.\n'
        exit 1
    fi

    if [[ -z "$status_output" ]]; then
        return
    fi

    printf 'WARNING: --package-dist requires a clean git repository.\n'
    printf 'Uncommitted changes were detected; aborting to prevent accidental tagging.\n'
    exit 1
}

set_param_set() {
    local requested="$1"

    if [[ -z "$PARAM_SET" ]]; then
        PARAM_SET="$requested"
        return
    fi

    if [[ "$PARAM_SET" != "$requested" ]]; then
        printf 'Invalid flag combination across parameter sets: %s and %s\n' "$PARAM_SET" "$requested"
        exit 1
    fi
}

# -----------------------------
# Python Environment Functions
# -----------------------------

initialize_python_environment() {
    local had_new_venv=0

    if [[ -d "$PYENV_PATH" ]]; then
        printf 'Virtual environment already exists: %s\n' "$PYENV_PATH"
        echo 0
        return
    fi

    # --seed ensures pip/setuptools/wheel are available in new uv venvs.
    uv venv --seed --python "$PYENV_VERSION" "$PYENV_PATH"

    local pip_version
    pip_version="$("$PYTHON_EXE" -m pip --version 2>/dev/null || true)"
    test_tool_status "[$PYENV_NAME] pip" "$pip_version"

    printf '[%s] Upgrading packaging tools...\n' "$PYENV_NAME"
    "$PYTHON_EXE" -m pip install --upgrade pip
    "$PYTHON_EXE" -m pip install --upgrade --force-reinstall build wheel
    "$PYTHON_EXE" -m pip install --upgrade --force-reinstall setuptools
    "$PYTHON_EXE" -m pip install --upgrade --force-reinstall setuptools_rust

    printf '[%s] Installing project in editable mode...\n' "$PYENV_NAME"
    "$PYTHON_EXE" -m pip install -e "$MAJORDOME_INSTALL"

    had_new_venv=1
    echo "$had_new_venv"
}

invoke_venv_activation() {
    local cargo_version quarto_version uv_version

    cargo_version="$(cargo --version 2>/dev/null || true)"
    test_tool_status "Cargo" "$cargo_version"

    quarto_version="$(quarto --version 2>/dev/null || true)"
    test_tool_status "Quarto" "$quarto_version"

    uv_version="$(uv --version 2>/dev/null || true)"
    test_tool_status "uv" "$uv_version"

    case "$PYTHON_ENV" in
        py312)
            PYENV_NAME="py312"
            PYENV_VERSION="3.12"
            PYENV_PATH="${SCRIPT_DIR}/.venv312"
            ;;
        py313)
            PYENV_NAME="py313"
            PYENV_VERSION="3.13"
            PYENV_PATH="${SCRIPT_DIR}/.venv313"
            ;;
        py314)
            PYENV_NAME="py314"
            PYENV_VERSION="3.14"
            PYENV_PATH="${SCRIPT_DIR}/.venv314"
            ;;
        *)
            printf 'Invalid Python environment selection: %s\n' "$PYTHON_ENV"
            printf 'Use: --python-env py312 | py313 | py314\n'
            exit 1
            ;;
    esac

    PYTHON_EXE="${PYENV_PATH}/bin/python"

    local has_new_venv
    has_new_venv="$(initialize_python_environment)"

    export QUARTO_PYTHON="$PYTHON_EXE"
    printf 'QUARTO_PYTHON set to: %s\n' "$QUARTO_PYTHON"

    local activate_script="${PYENV_PATH}/bin/activate"
    if [[ ! -f "$activate_script" ]]; then
        printf 'Could not find activation script: %s\n' "$activate_script"
        exit 1
    fi

    # Source activation so selected venv remains active for subsequent commands.
    # shellcheck source=/dev/null
    source "$activate_script"
    printf 'Activated Python environment: %s\n' "$PYENV_NAME"

    if [[ "$has_new_venv" == "1" ]]; then
        quarto install tinytex
        quarto check
    fi

    "$QUARTO_PYTHON" -c 'import setuptools; print(setuptools.__file__)'
}

install_python_package() {
    # Keep editable install options aligned with build.ps1 behavior.
    local opts=(--no-deps --no-build-isolation)

    if [[ "$FLAG_RELEASE" -eq 1 ]]; then
        opts+=("--config-settings=rust.debug=false")
    fi

    printf '[%s] Installing editable package\n' "$PYENV_NAME"

    if [[ "$PACKAGE_DIST" -eq 1 ]]; then
        ensure_clean_git_for_package_dist
        "$PYTHON_EXE" version.py -tag
    fi

    "$PYTHON_EXE" -m pip install -e "$MAJORDOME_INSTALL" "${opts[@]}"
    majordome --install-kernel

    if [[ "$PACKAGE_DIST" -eq 1 ]]; then
        "$PYTHON_EXE" -m build --wheel

        local dist_path latest_wheel
        dist_path="${SCRIPT_DIR}/dist"
        latest_wheel="$(ls -1t "$dist_path"/*.whl 2>/dev/null | head -n 1 || true)"

        if [[ -n "$latest_wheel" ]]; then
            printf '\n[%s] Latest wheel: %s\n' "$PYENV_NAME" "$(basename "$latest_wheel")"

            printf '\nData files in wheel:\n'
            "$PYTHON_EXE" -m zipfile -l "$latest_wheel" | grep -i data || true

            printf '\nRust extension modules (.pyd) in wheel:\n'
            "$PYTHON_EXE" -m zipfile -l "$latest_wheel" | grep -i pyd || true
        else
            printf 'No wheel file found in dist/\n'
        fi
    fi

    exit 0
}

# -----------------------------
# Argument Parsing
# -----------------------------

while [[ $# -gt 0 ]]; do
    case "$1" in
        --release|-FlagRelease)
            set_param_set "Build"
            FLAG_RELEASE=1
            shift
            ;;
        --backtrace|-FlagBacktrace)
            set_param_set "Build"
            FLAG_BACKTRACE=1
            shift
            ;;
        --rust-check|-RustCheck)
            set_param_set "Build"
            RUST_CHECK=1
            shift
            ;;
        --rust-core|-RustCore)
            set_param_set "Build"
            RUST_CORE=1
            shift
            ;;
        --test-rust|-TestRust)
            set_param_set "Build"
            TEST_RUST=1
            shift
            ;;
        --test-python|-TestPython)
            set_param_set "Build"
            TEST_PYTHON=1
            shift
            ;;
        --from-pip|-FromPip)
            set_param_set "Build"
            FROM_PIP=1
            shift
            ;;
        --package-dist|-PackageDist)
            set_param_set "Build"
            PACKAGE_DIST=1
            shift
            ;;
        --package-docs|-PackageDocs)
            set_param_set "Docs"
            PACKAGE_DOCS=1
            shift
            ;;
        --fresh-docs|-FreshDocs)
            set_param_set "Docs"
            FRESH_DOCS=1
            shift
            ;;
        --docs-pdf|-DocsPdf)
            set_param_set "Docs"
            DOCS_PDF=1
            shift
            ;;
        --publish-docs|-PublishDocs)
            set_param_set "PublishDocs"
            PUBLISH_DOCS=1
            shift
            ;;
        --clean|-Clean)
            set_param_set "Clean"
            CLEAN=1
            shift
            ;;
        --dist-clean|-DistClean)
            set_param_set "Clean"
            DIST_CLEAN=1
            shift
            ;;
        --help|-Help)
            set_param_set "Help"
            HELP=1
            shift
            ;;
        --dummy|-Dummy)
            set_param_set "Dummy"
            DUMMY=1
            shift
            ;;
        --python-env|-PythonEnv)
            if [[ $# -lt 2 ]]; then
                printf 'Missing value for %s\n' "$1"
                exit 1
            fi
            PYTHON_ENV="$2"
            shift 2
            ;;
        *)
            printf 'Unknown argument: %s\n' "$1"
            usage
            exit 1
            ;;
    esac
done

# Validate dependent flags (matching ValidateScript behavior in PowerShell).
if [[ "$PACKAGE_DIST" -eq 1 && "$FROM_PIP" -ne 1 ]]; then
    printf '%s\n' '--package-dist requires --from-pip.'
    exit 1
fi

if [[ "$FRESH_DOCS" -eq 1 && "$PACKAGE_DOCS" -ne 1 ]]; then
    printf '%s\n' '--fresh-docs requires --package-docs.'
    exit 1
fi

if [[ "$DOCS_PDF" -eq 1 && "$PACKAGE_DOCS" -ne 1 ]]; then
    printf '%s\n' '--docs-pdf requires --package-docs.'
    exit 1
fi

# -----------------------------
# Main Flow
# -----------------------------

main() {
    if [[ "$HELP" -eq 1 ]]; then
        usage
        exit 0
    fi

    if [[ "$CLEAN" -eq 1 || "$DIST_CLEAN" -eq 1 ]]; then
        printf 'Cleaning previous builds...\n'
        remove_hard "${SCRIPT_DIR}/build"
        remove_hard "${SCRIPT_DIR}/target"
        remove_hard "${SCRIPT_DIR}/log.*"
        remove_hard "${SCRIPT_DIR}/__pycache__"
        remove_hard "${SCRIPT_DIR}/*.egg-info"
        remove_hard "${SCRIPT_DIR}/.quarto"
        remove_hard "${SCRIPT_DIR}/.vscode"
        remove_hard "${SCRIPT_DIR}/_book"

        if [[ "$DIST_CLEAN" -eq 1 ]]; then
            printf 'Cleaning distribution and environment...\n'
            remove_hard "${SCRIPT_DIR}/venv312"
            remove_hard "${SCRIPT_DIR}/venv313"
            remove_hard "${SCRIPT_DIR}/venv314"
            remove_hard "${SCRIPT_DIR}/dist"
        fi

        exit 0
    fi

    export RUSTFLAGS='-A warnings'
    export RUST_BACKTRACE='0'
    export SETUPTOOLS_RUST_CARGO_PROFILE='dev'
    export CARGO_INCREMENTAL='1'

    if [[ "$FLAG_RELEASE" -eq 1 ]]; then
        export RUSTFLAGS+=" -C opt-level=3"
        export SETUPTOOLS_RUST_CARGO_PROFILE='release'
    fi

    if [[ "$FLAG_BACKTRACE" -eq 1 ]]; then
        export RUST_BACKTRACE='1'
    fi

    printf '\n'
    printf 'Environment variables set:\n'
    printf 'RUSTFLAGS ....................: %s\n' "$RUSTFLAGS"
    printf 'RUST_BACKTRACE ...............: %s\n' "$RUST_BACKTRACE"
    printf 'SETUPTOOLS_RUST_CARGO_PROFILE : %s\n' "$SETUPTOOLS_RUST_CARGO_PROFILE"
    printf 'CARGO_INCREMENTAL ............: %s\n' "$CARGO_INCREMENTAL"
    printf '\n'

    local needs_python_env=0
    if [[ "$FROM_PIP" -eq 1 || "$TEST_PYTHON" -eq 1 || "$PACKAGE_DOCS" -eq 1 || "$PUBLISH_DOCS" -eq 1 || "$DUMMY" -eq 1 ]]; then
        needs_python_env=1
    fi

    if [[ "$needs_python_env" -eq 1 && -z "${PYTHON_ENV// }" ]]; then
        printf 'Python environment is required for this operation.\n'
        printf 'Use: --python-env py312 | py313 | py314\n'
        exit 1
    fi

    if [[ "$needs_python_env" -eq 1 ]]; then
        invoke_venv_activation
    fi

    if [[ "$FROM_PIP" -eq 1 ]]; then
        install_python_package
    fi

    if [[ "$RUST_CORE" -eq 1 ]]; then
        local opts=()
        if [[ "$FLAG_RELEASE" -eq 1 ]]; then
            opts+=(--release)
        fi
        cargo build "${opts[@]}" --manifest-path "$PATH_CORE"
        exit 0
    fi

    if [[ "$RUST_CHECK" -eq 1 ]]; then
        cargo check --manifest-path "$PATH_CORE"
        exit 0
    fi

    if [[ "$TEST_RUST" -eq 1 ]]; then
        cargo test --manifest-path "$PATH_CORE"
        exit 0
    fi

    if [[ "$TEST_PYTHON" -eq 1 ]]; then
        "$PYTHON_EXE" -m pytest -v
        exit 0
    fi

    if [[ "$PACKAGE_DOCS" -eq 1 ]]; then
        local opts=()

        if [[ "$FRESH_DOCS" -eq 1 ]]; then
            opts+=(--no-cache)
            remove_hard "${SCRIPT_DIR}/_book"
            remove_hard "${SCRIPT_DIR}/_site"
        fi

        quarto render --to html "${opts[@]}"

        if [[ "$DOCS_PDF" -eq 1 ]]; then
            quarto render --to pdf "${opts[@]}"
        fi

        exit 0
    fi

    if [[ "$PUBLISH_DOCS" -eq 1 ]]; then
        quarto publish gh-pages --no-prompt --no-browser
        exit 0
    fi

    printf 'No build option specified.\n'
}

main
