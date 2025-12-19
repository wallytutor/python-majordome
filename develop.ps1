
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
# Messages
# ----------------------------------------------------------------------------

function Write-Head {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Cyan
}

function Write-Warn {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Yellow
}

function Write-Good {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Green
}

function Write-Bad {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Red
}

# ----------------------------------------------------------------------------
# Steps
# ----------------------------------------------------------------------------

function Initialize-VirtualEnvironment {
    Write-Head "Working from a virtual environment..."

    $VenvPath = Join-Path $PSScriptRoot ".venv"
    $VenvActivate = Join-Path $VenvPath "Scripts\Activate.ps1"

    if (-not (Test-Path $VenvPath)) {
        Write-Warn "Virtual environment not found, creating one..."
        python -m venv $VenvPath

        if ($LASTEXITCODE -ne 0) {
            Write-Bad "Failed to create virtual environment!"
            return $false
        }
    }

    Write-Good "Activating virtual environment..."
    & $VenvActivate

    return $true
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
    $pkg = "$PSScriptRoot[docs,extras,pdftools,vision]"
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
    if ($FreshDocs) { $opts = "-E" + $opts }

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
    Remove-Item -Recurse -Force $(Join-Path $PSScriptRoot "build") -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force $(Join-Path $PSScriptRoot "target") -ErrorAction SilentlyContinue
    Remove-Item -Force $(Join-Path $PSScriptRoot "log.*") -ErrorAction SilentlyContinue
}

if ($DistClean) {
    Write-Warn "Cleaning distribution and environment..."
    Remove-Item -Recurse -Force $(Join-Path $PSScriptRoot ".venv") -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force $(Join-Path $PSScriptRoot "dist") -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force $(Join-Path $PSScriptRoot "docs\_build") -ErrorAction SilentlyContinue
}

if ($Isolate) {
    if (-not (Initialize-VirtualEnvironment)) {
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