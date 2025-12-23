# ---------------------------------------------------------------------------
# python.ps1
# ---------------------------------------------------------------------------

function Check-HasPython {
    try {
        python --version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function Get-PythonMajorVersion {
    return python -c "import sys; print(sys.version_info.major)"
}

function Get-PythonMinorVersion {
    return python -c "import sys; print(sys.version_info.minor)"
}

function Check-HasValidPython {
    param (
        [int]$RequiredMinor = 12
    )
    if (-not (Check-HasPython)) {
        return $false
    }

    $major = Get-PythonMajorVersion
    $minor = Get-PythonMinorVersion

    if ($major -lt 3) {
        return $false
    }

    if ($major -eq 3 -and $minor -lt $RequiredMinor) {
        return $false
    }

    return $true
}

function Piperish() {
    param (
        [string]$PythonPath = "$env:PYTHON_HOME\python.exe"
    )
    if (-not $PythonPath) {
        Write-Bad "Required Python not found: $PythonPath..."
        exit 1
    }

    $argList = @("-m", "pip", "--trusted-host", "pypi.org",
                 "--trusted-host", "files.pythonhosted.org") + $args
    # Write-Host "Invoking: $PythonPath $($argList -join ' ')"
    Invoke-CapturedCommand $PythonPath $argList
}

function Initialize-VirtualEnvironment {
    param (
        [string]$VenvRoot = ".",
        [string]$VenvName = ".venv",
        [int]$RequiredMinor = 12
    )

    if (-not (Check-HasValidPython -RequiredMinor $RequiredMinor)) {
        Write-Bad "Python 3.$RequiredMinor or higher is required."
        return $false
    }

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