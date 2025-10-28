# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionLangConfigure() {
    Write-Host "- starting Kompanion languages configuration..."

    Invoke-ConfigurePython
    Invoke-ConfigureJulia
    Invoke-ConfigureErlang
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-ConfigurePython() {
    $env:PYTHON_HOME = "$env:KOMPANION_BIN\python\WPy64-31380\python"
    Initialize-AddToPath -Directory "$env:PYTHON_HOME\Scripts"
    Initialize-AddToPath -Directory "$env:PYTHON_HOME"

    # Jupyter to be used with IJulia (if any) and data path:
    $env:JUPYTER = "$env:PYTHON_HOME\Scripts\jupyter.exe"

    # Path to Jupyter kernels, etc.:
    $env:JUPYTER_DATA_DIR = "$env:KOMPANION_DATA\jupyter"

    # Install minimal requirements:
    $pythonLock = "$env:KOMPANION_DATA\python.lock"

    if (!(Test-Path $pythonLock)) {
        Piperish install --upgrade pip
        Piperish install -r "$env:KOMPANION_SRC\data\requirements.txt"
        Piperish install -e "$env:KOMPANION_DIR"
        New-Item -ItemType File -Path $pythonLock -Force | Out-Null
    }
}

function Invoke-ConfigureJulia() {
}

function Invoke-ConfigureErlang() {
    $env:ERLANG_HOME = "$env:KOMPANION_BIN\erlang\bin"
    Initialize-AddToPath -Directory "$env:ERLANG_HOME"
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------