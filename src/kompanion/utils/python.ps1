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

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------