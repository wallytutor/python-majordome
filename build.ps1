
<#
.SYNOPSIS
    Build script for the majordome project with Rust and Python components.

.DESCRIPTION
    This script manages the build process for the majordome project, which
    includes Rust libraries and Python packages. It handles virtual environment
    setup, Rust compilation, Python package installation, and testing.

.PARAMETER FlagRelease
    Build in release mode with optimizations enabled. Sets CARGO_PROFILE to "release"
    and adds optimization flags to RUSTFLAGS.

.PARAMETER FlagBacktrace
    Enable Rust backtraces by setting RUST_BACKTRACE=1. Useful for debugging.

.PARAMETER RustCheck
    Run cargo check on all Rust libraries to verify compilation without building.

.PARAMETER RustCore
    Build only the core Rust library (crates/core).

.PARAMETER TestRust
    Run Rust tests using cargo test on the test crate.

.PARAMETER TestPython
    Run Python tests using pytest with verbose output.

.PARAMETER FromPip
    Install the Python package using pip with editable mode. This builds the Rust
    extensions and links the package for development.

.PARAMETER PackageDist
    Create a wheel distribution package for the Python package.

.PARAMETER PackageDocs
    Build the Sphinx documentation in HTML format.

.PARAMETER FreshDocs
    Force a fresh build of the Sphinx documentation by clearing the cache.
    Used with -PackageDocs.

.PARAMETER DocsPdf
    Build the Sphinx documentation in PDF format.

.PARAMETER Clean
    Remove build artifacts and log files (build/, target/, log.*).

.PARAMETER DistClean
    Perform a full clean including virtual environments, distribution files, and
    documentation builds (venv/, dist/, docs/_build/).

.PARAMETER Help
    Display this help message and exit.
#>

param (
    # -- Build options

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FlagRelease,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FlagBacktrace,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$RustCheck,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$RustCore,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$TestRust,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$TestPython,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FromPip,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [ValidateScript({
        if (-not $FromPip) { throw "-PackageDist requires -FromPip." }
        $true
    })]
    [switch]$PackageDist,

    # -- Documentation options

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [switch]$PackageDocs,

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [ValidateScript({
        if (-not $PackageDocs) { throw "-FreshDocs requires -PackageDocs." }
        $true
    })]
    [switch]$FreshDocs,

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [ValidateScript({
        if (-not $PackageDocs) { throw "-DocsPdf requires -PackageDocs." }
        $true
    })]
    [switch]$DocsPdf,

    # -- Clean options

    [Parameter(Mandatory=$false, ParameterSetName="Clean")]
    [switch]$Clean,

    [Parameter(Mandatory=$false, ParameterSetName="Clean")]
    [switch]$DistClean,

    # -- Help

    [Parameter(Mandatory=$false, ParameterSetName="Help")]
    [switch]$Help
)

$env:MAJORDOME_INSTALL = "$PSScriptRoot[full]"

$PATH_CORE =  "Cargo.toml"
$VENV_PATH =  "venv"

function Remove-Hard {
    param (
        [string]$path
    )
    Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
}

function Set-EnvironmentVariables {
    $env:RUSTFLAGS = "-A warnings"
    $env:RUST_BACKTRACE = 0
    $env:SETUPTOOLS_RUST_CARGO_PROFILE = "dev"
    $env:CARGO_INCREMENTAL = 1

    if ($FlagRelease) {
        $env:RUSTFLAGS += " -C opt-level=3"
        $env:SETUPTOOLS_RUST_CARGO_PROFILE = "release"
    }

    if ($FlagBacktrace) {
        $env:RUST_BACKTRACE = 1
    }

    Write-Host ""
    Write-Host "Environment variables set:"
    Write-Host "RUSTFLAGS ....................: $env:RUSTFLAGS"
    Write-Host "RUST_BACKTRACE ...............: $env:RUST_BACKTRACE"
    Write-Host "SETUPTOOLS_RUST_CARGO_PROFILE : $env:SETUPTOOLS_RUST_CARGO_PROFILE"
    Write-Host "CARGO_INCREMENTAL ............: $env:CARGO_INCREMENTAL"
    Write-Host ""
}

function Invoke-VenvActivation {
    Write-Host "`nChecking for Cargo (Rust)..."
    $cargoVersion = cargo --version 2>$null

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Cargo found: $cargoVersion"
    } else {
        Write-Host "Cargo not found! Please install Rust..."
        exit 1
    }

    if (-not (Test-Path $VENV_PATH)) {
        & python -m venv $VENV_PATH
        & "$VENV_PATH\Scripts\Activate.ps1"
        & python -m pip install --upgrade pip
        & python -m pip install --upgrade --force-reinstall build wheel
        & python -m pip install --upgrade --force-reinstall setuptools
        & python -m pip install --upgrade --force-reinstall setuptools_rust
        & python -m pip install -e "$env:MAJORDOME_INSTALL"
    }

    if (-not $env:VIRTUAL_ENV) {
        & "$VENV_PATH\Scripts\Activate.ps1"
        & python -c "import setuptools, inspect; print(setuptools.__file__)"
    }
}

function Invoke-CheckRustLibs {
    cargo check --manifest-path "Cargo.toml"
    exit 0
}

function Invoke-TestRustLibs {
    cargo test --manifest-path "Cargo.toml"
    exit 0
}

function Invoke-TestPythonLibs {
    pytest -v
    exit 0
}

function Build-RustLib {
    param (
        [string]$path
    )

    $opts = @()
    if ($FlagRelease) { $opts += "--release" }
    cargo build @opts --manifest-path $path
    exit 0
}

function Invoke-InspectWheel {
    $distPath = Join-Path $PSScriptRoot "dist"

    $latestWheel = Get-ChildItem -Path $distPath -Filter "*.whl" |
                   Sort-Object LastWriteTime -Descending |
                   Select-Object -First 1

    if ($latestWheel) {
        Write-Host "`nLatest wheel: $($latestWheel.Name)"

        Write-Host "`nData files in wheel:"
        python -m zipfile -l $latestWheel.FullName | Select-String "data"

        Write-Host "`nRust extension modules (.pyd) in wheel:"
        python -m zipfile -l $latestWheel.FullName | Select-String "pyd"
    } else {
        Write-Host "No wheel file found in dist/"
    }
}

function Install-PythonPackage {
    # XXX: the following is fragile, it injects the legacy setup.py
    # build_ext --inplace option in a PEP 517 compliant build. It was
    # the only way I found to get the .pyd files generated in the source
    # directory, for accelerating the development cycle.
    # "--config-settings=--build-option=--inplace"

    # XXX: using the following it stopped generating the .pyd files
    # for some reason, even though it was working before. Maybe deps?
    # UPDATE: the project venv was missing setuptools-rust (which was
    # being used from elswhere), reasong why it was not working!
    $opts = @("--no-deps", "--no-build-isolation")

    if ($FlagRelease) { $opts += "--config-settings=rust.debug=false" }
    & python -m pip install -e $env:MAJORDOME_INSTALL @opts

    if ($PackageDist) {
        & python -m build --wheel
        Invoke-InspectWheel
    }

    exit 0
}

function Invoke-BuildDocs {
    $opts = @()

    if ($FreshDocs) {
        $opts = $opts + "--no-cache"
        Remove-Hard $(Join-Path $PSScriptRoot "_book")
        Remove-Hard $(Join-Path $PSScriptRoot "_site")
    }

    & quarto render --to html @opts

    if ($DocsPdf) {
        & quarto render --to pdf @opts
    }

    exit 0
}

function Main {
    if ($Help) {
        Get-Help $PSCommandPath
        exit 0
    }

    if ($Clean -or $DistClean) {
        Write-Warn "Cleaning previous builds..."
        Remove-Hard $(Join-Path $PSScriptRoot "build")
        Remove-Hard $(Join-Path $PSScriptRoot "target")
        Remove-Hard $(Join-Path $PSScriptRoot "log.*")
    }

    if ($DistClean) {
        Write-Warn "Cleaning distribution and environment..."
        Remove-Hard $(Join-Path $PSScriptRoot "venv")
        Remove-Hard $(Join-Path $PSScriptRoot "dist")
        Remove-Hard $(Join-Path $PSScriptRoot "docs\_build")
    }

    Set-EnvironmentVariables
    Invoke-VenvActivation

    if ($RustCore)    { Build-RustLib -path $PATH_CORE }
    if ($RustCheck)   { Invoke-CheckRustLibs }
    if ($FromPip)     { Install-PythonPackage }

    if ($TestRust)    { Invoke-TestRustLibs }
    if ($TestPython)  { Invoke-TestPythonLibs }
    if ($PackageDocs) { Invoke-BuildDocs }

    Write-Host "No build option specified."
}

Main
