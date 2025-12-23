# ---------------------------------------------------------------------------
# python.ps1
# ---------------------------------------------------------------------------

function Piperish() {
    # TODO make this compatible with virtual environments
    $pythonPath = "$env:PYTHON_HOME\python.exe"

    if (Test-Path -Path $pythonPath) {
        $argList = @("-m", "pip", "--trusted-host", "pypi.org",
                     "--trusted-host", "files.pythonhosted.org") + $args
        Invoke-CapturedCommand $pythonPath $argList
    } else {
        Write-Host "Python executable not found!"
    }
}

function Initialize-VirtualEnvironment {
    param (
        [string]$VenvRoot = ".",
        [string]$VenvName = ".venv"
    )
    Write-Head "Working from a virtual environment..."

    $VenvPath = Join-Path $VenvRoot $VenvName
    $VenvActivate = Join-Path $VenvPath "Scripts\Activate.ps1"
    Write-Head "Virtual environment path: $VenvPath"

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

    Write-Good "Ensuring the latest pip is installed..."
    & python -m pip install --upgrade pip 2>&1

    if ($LASTEXITCODE -ne 0) {
        Write-Bad "Failed to upgrade pip!"
        return $false
    }

    $requirements = Join-Path $VenvRoot "requirements.txt"

    if (Test-Path $requirements) {
        Write-Good "Installing required packages from $requirements ..."
        & python -m pip install -r $requirements > log.pipInstall 2>&1

        if ($LASTEXITCODE -ne 0) {
            Write-Bad "Failed to install required packages!"
            return $false
        }
    } else {
         Write-Warn "No requirements.txt found at $requirements"
    }

    return $true
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------