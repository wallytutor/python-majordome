#!/usr/bin/env bash
##############################################################################
# XXX: under SELinux, may need to label the current directory for container:
# sudo semanage fcontext -a -t container_file_t "$(realpath $PWD)(/.*)?"
# sudo restorecon -Rv "$(realpath $PWD)"
##############################################################################

CONTAINER=/usr/bin/podman

FLAG_BUILD_PY312=true
FLAG_BUILD_PY313=false
FLAG_BUILD_DOCS=false
FLAG_BUILD_CLEAN=false

parse_args() {
    while [ $# -gt 0 ]; do
        case $1 in
            --no-py312)
                FLAG_BUILD_PY312=false
                ;;
            --py313)
                FLAG_BUILD_PY313=true
                ;;
            --docs)
                FLAG_BUILD_DOCS=true
                ;;
            --clean)
                FLAG_BUILD_CLEAN=true
                ;;
            *)
                echo "Unknown argument: $1" >&2
                exit 1
                ;;
        esac
        shift
    done
}

ensure_local_run() {
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    cd "${script_dir}" || {
        echo "Error: Cannot change to script directory: ${script_dir}" >&2
        exit 1
    }
}

clean_start() {
    ensure_local_run

    rm -rf \
        build/ \
        dist/ \
        docs/_build/ \
        src/majordome/*.so \
        src/majordome.egg-info/ \
        target/
}

majordome_build() {
    local python=$1

    "${python}" -m pip install -e .[docs,extras]

    if [ $? -ne 0 ]; then
        echo "Error: pip install failed" >&2
        exit 1
    fi

    "${python}" -m build --wheel --sdist

    if [ $? -ne 0 ]; then
        echo "Error: wheel build failed" >&2
        exit 1
    fi
}

majordome_docs_build() {
    local python=$1
    local dest="docs/references.bib"

    if [ ! -f "${dest}" ]; then
        repo="https://raw.githubusercontent.com/wallytutor/notes-book"
        file="${repo}/refs/heads/main/references.bib"
        wget "${file}" -O "${dest}"
    fi

    "${python}" -m sphinx -E -b html -c docs/ docs/src/ docs/_build/
}

majordome_develop() {
    if [ "${FLAG_BUILD_PY312}" = true ]; then
        majordome_build '/opt/python3.12/bin/python3.12'
    fi

    if [ "${FLAG_BUILD_PY313}" = true ]; then
        majordome_build '/opt/python3.13/bin/python3.13'
    fi

    if [ "${FLAG_BUILD_DOCS}" = true ]; then
        # XXX: build docs with Python 3.12 for now:
        majordome_docs_build '/opt/python3.12/bin/python3.12'
    fi
}

container_start() {
    local image_name="localhost/majordome:latest"
    local image_bind="$(realpath $PWD):/opt/app"
    local context="$(realpath $PWD)/src/configuration"

    local ports=""
    ports+=" -p 7000:7000" # internal-flow-su2.py

    if "${CONTAINER}" image exists "${image_name}"; then
        "${CONTAINER}" run -it ${ports} \
            -v "${image_bind}" "${image_name}" /bin/bash
    else
        "${CONTAINER}" build -t "majordome" \
            -f "${context}/Containerfile" "${context}"
    fi
}

main() {
    ensure_local_run
    parse_args "$@"

    if [ "${FLAG_BUILD_CLEAN}" = true ]; then
        clean_start
    fi

    if [ -f "/run/.containerenv" ] || [ -f "/.dockerenv" ]; then
        majordome_develop
    else
        container_start
    fi
}

##############################################################################
# MAIN
##############################################################################

main "$@"

##############################################################################
# EOF
##############################################################################