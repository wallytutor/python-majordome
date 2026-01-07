
<#
.SYNOPSIS
    Development build script for the Majordome project under Windows.

.DESCRIPTION
    This script automates the development workflow for Majordome, a mixed
    Python/Rust project. It handles dependency checks, builds the project
    in development mode, generates documentation, and creates distribution
    packages.

.PARAMETER Clean
    Removes build artifacts and log files (build/, target/, log.*).

.PARAMETER DistClean
    Performs a full clean including virtual environments, distribution
    files, and documentation builds (.venv/, dist/, docs/_build/).

.PARAMETER Isolate
    Initializes and activates a virtual environment before building.

.PARAMETER Distribute
    Creates a wheel distribution package and displays its contents,
    including data files and Rust extension modules (.pyd).

.PARAMETER Documentation
    Builds the Sphinx documentation in HTML format.

.PARAMETER FreshDocs
    Forces a fresh documentation build by clearing the cache (used with
    -Documentation).

.EXAMPLE
    .\develop.ps1
    Performs a standard development build.

.EXAMPLE
    .\develop.ps1 -Clean -Isolate
    Cleans previous builds, sets up a virtual environment, and builds.

.EXAMPLE
    .\develop.ps1 -Documentation -FreshDocs
    Rebuilds the documentation from scratch.

.EXAMPLE
    .\develop.ps1 -DistClean -Isolate -Distribute
    Full clean, setup virtual environment, build, and create distribution
    package.

.NOTES
    Requirements:
    - Rust/Cargo toolchain
    - Python with pip

    Build logs are written to log.build, log.dist, and log.docs files.
#>

# ----------------------------------------------------------------------------
# Parameters
# ----------------------------------------------------------------------------

param (
    [switch]$Clean,
    [switch]$DistClean,
    [switch]$Isolate,
    [switch]$Distribute,
    [switch]$Documentation,
    [switch]$FreshDocs
)

# ----------------------------------------------------------------------------
# Steps
# ----------------------------------------------------------------------------

function Rm-Rf {
    param (
        [string]$Path
    )
    Remove-Item -Recurse -Force $Path -ErrorAction SilentlyContinue
}

function Get-StatusMessage {
    param( [string]$Message = "" )

    if ($LASTEXITCODE -eq 0) {
        Write-Good ">>> Success!"
        if ($Message) { Write-Good $Message }
        return $true
    } else {
        Write-Bad ">>> Failed!"
        if ($Message) { Write-Bad $Message }
        return $false
    }
}

function Test-Cargo {
    Write-Head "`nChecking for Cargo (Rust)..."
    $cargoVersion = cargo --version 2>$null

    if ($LASTEXITCODE -eq 0) {
        $out = "Cargo found: $cargoVersion"
    } else {
        $out = "Cargo not found! Please install Rust..."
    }

    return Get-StatusMessage -Message $out
}

function Test-PipUpgrade {
    Write-Head "`nChecking for pip and upgrading it..."
    & python -m pip install --upgrade pip 2>&1
    return Get-StatusMessage
}

function Test-PipSetupTools {
    Write-Head "`nInstalling/upgrading setuptools-rust..."
    $deps = @("setuptools", "setuptools-rust", "build")
    & python -m pip install --upgrade $deps 2>&1
    return Get-StatusMessage
}

function Test-RequiredTools {
    Write-Head "`nChecking for required tools..."

    if (-not (Test-Cargo)) {
        return $false
    }

    if (-not (Test-PipUpgrade)) {
        return $false
    }

    if (-not (Test-PipSetupTools)) {
        return $false
    }

    Write-Good "`n=== Build tools ready =="
    return $true
}

function Invoke-DevelopBuild {
    Write-Head "`nBuilding and installing development version..."
    $pkg = "$PSScriptRoot[docs,extras]"
    & python -m pip install -e $pkg --no-build-isolation > log.build 2>&1
    return Get-StatusMessage "Check log.build"
}

function Invoke-DistBuild {
    Write-Head "`nCreating new wheel version..."
    & python -m build --wheel > log.dist 2>&1
    return Get-StatusMessage "Check log.dist"
}

function Invoke-BuildDocs {
    Write-Head "`nBuilding documentation..."

    $opts = @("-b", "html")
    if ($FreshDocs) { $opts = $opts + "-E" }

    $what = @("docs/", "docs/src/", "docs/_build/")
    & sphinx-build $opts -c $what > log.docs 2>&1
    return Get-StatusMessage "Check log.docs"
}

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------

Write-Head "=== Majordome Development Setup ==="

if ($Clean -or $DistClean) {
    Write-Warn "Cleaning previous builds..."
    Rm-Rf $(Join-Path $PSScriptRoot "build")
    Rm-Rf $(Join-Path $PSScriptRoot "target")
    Rm-Rf $(Join-Path $PSScriptRoot "log.*")
}

if ($DistClean) {
    Write-Warn "Cleaning distribution and environment..."
    Rm-Rf $(Join-Path $PSScriptRoot ".venv")
    Rm-Rf $(Join-Path $PSScriptRoot "dist")
    Rm-Rf $(Join-Path $PSScriptRoot "docs\_build")
}

if ($Isolate) {
    if (-not (Initialize-VirtualEnvironment -VenvRoot $PSScriptRoot)) {
        exit 1
    }
}

if (-not (Test-RequiredTools)) {
    exit 1
}

if (-not (Invoke-DevelopBuild)) {
    exit 1
}

if ($Documentation) {
    if (-not (Invoke-BuildDocs)) {
        exit 1
    }
}

if ($Distribute) {
    if (-not (Invoke-DistBuild)) {
        exit 1
    }

    $distPath = Join-Path $PSScriptRoot "dist"
    $latestWheel = Get-ChildItem -Path $distPath -Filter "*.whl" |
                   Sort-Object LastWriteTime -Descending |
                   Select-Object -First 1

    if ($latestWheel) {
        Write-Head "`nLatest wheel: $($latestWheel.Name)"

        Write-Head "`nData files in wheel:"
        python -m zipfile -l $latestWheel.FullName | Select-String "data"

        Write-Head "`nRust extension modules (.pyd) in wheel:"
        python -m zipfile -l $latestWheel.FullName | Select-String "pyd"
    } else {
        Write-Warn "No wheel file found in dist/"
    }
}

# ----------------------------------------------------------------------------
# EOF
# ----------------------------------------------------------------------------