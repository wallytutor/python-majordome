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
    $lockFile = "$env:KOMPANION_DATA\python.lock"

    if (!(Test-Path $lockFile)) {
        Piperish install --upgrade pip
        Piperish install -r "$env:KOMPANION_SRC\data\requirements.txt"
        Piperish install -e "$env:KOMPANION_DIR"
        New-Item -ItemType File -Path $lockFile -Force | Out-Null
    }
}

function Invoke-ConfigureJulia() {
    # XXX: check if JULIA_HOME has any special meaning, otherwise add
    # \bin directly to its definition (I think I cannot do that...).
    $env:JULIA_HOME = "$env:KOMPANION_BIN\julia\julia-1.12.1"
    Initialize-AddToPath -Directory "$env:JULIA_HOME\bin"

    $env:JULIA_DEPOT_PATH   = "$env:KOMPANION_DATA\julia"
    $env:JULIA_CONDAPKG_ENV = "$env:KOMPANION_DATA\CondaPkg"

    # Install minimal requirements:
    $lockFile = "$env:KOMPANION_DATA\julia.lock"

    if (!(Test-Path $lockFile)) {
        # This will invode setup.jl which may take a long time...
        Invoke-CapturedCommand "$env:JULIA_HOME\bin\julia.exe" @("-e", "exit()")
        New-Item -ItemType File -Path $lockFile -Force | Out-Null
    }
}

function Invoke-ConfigureErlang() {
    $env:ERLANG_HOME = "$env:KOMPANION_BIN\erlang\bin"
    Initialize-AddToPath -Directory "$env:ERLANG_HOME"
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------