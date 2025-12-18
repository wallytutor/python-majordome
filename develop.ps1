
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
    $VenvPath = Join-Path $PSScriptRoot ".venv"
    $VenvActivate = Join-Path $VenvPath "Scripts\Activate.ps1"

    if (Test-Path $VenvPath) {
        Write-Good "Virtual environment found. Activating..."
        & $VenvActivate
    } else {
        Write-Warn "Creating virtual environment..."
        python -m venv $VenvPath

        if ($LASTEXITCODE -ne 0) {
            Write-Bad "Failed to create virtual environment!"
            return $false
        }

        Write-Good "Activating virtual environment..."
        & $VenvActivate
    }

    return $true
}

function Test-RequiredTools {
    Write-Head "`nChecking for required tools..."

    # Check if cargo is available
    Write-Head "Checking for Cargo (Rust)..."
    $cargoVersion = cargo --version 2>$null

    if ($LASTEXITCODE -eq 0) {
        Write-Good "  Cargo found: $cargoVersion"
    } else {
        Write-Bad "  Cargo not found! Please install Rust..."
        return $false
    }

    # Install maturin
    Write-Head "`nInstalling/upgrading maturin..."
    $pipOutput = & python -m pip install --upgrade maturin 2>&1

    if ($LASTEXITCODE -ne 0) {
        Write-Bad "Failed to install maturin!"
        Write-Bad $pipOutput
        return $false
    }

    # Verify maturin installation
    try {
        $maturinVersion = & maturin --version 2>&1

        if ($LASTEXITCODE -eq 0) {
            Write-Good "  Maturin ready: $maturinVersion"
        } else {
            Write-Bad "  Maturin installation failed!"
            return $false
        }
    }
    catch {
        Write-Bad "  Maturin not found in PATH!"
        return $false
    }

    return $true
}

function Invoke-MaturinDevelop {
    Write-Head "`nBuilding and installing development version..."
    maturin develop

    if ($LASTEXITCODE -eq 0) {
        Write-Good "`n=== Setup Complete ==="
        Write-Good "The package has been built and installed in development mode."
        return $true
    } else {
        Write-Bad "`n=== Build Failed ==="
        Write-Bad "Please check the error messages above."
        return $false
    }
}

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------

function Main {
    Write-Head "=== Majordome Development Setup ==="

    # Step 1: Create or activate virtual environment
    if (-not (Initialize-VirtualEnvironment)) {
        exit 1
    }

    # Step 2: Install maturin and test for cargo
    if (-not (Test-RequiredTools)) {
        exit 1
    }

    # Step 3: Run maturin develop
    if (-not (Invoke-MaturinDevelop)) {
        exit 1
    }
}

Main

# ----------------------------------------------------------------------------
# EOF
# ----------------------------------------------------------------------------