# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionLangConfigure() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion languages configuration..."

    if ($Config.python)  { Invoke-ConfigurePython }
    if ($Config.julia)   { Invoke-ConfigureJulia }
    if ($Config.node)    { Invoke-ConfigureNode }
    if ($Config.erlang)  { Invoke-ConfigureErlang }
    if ($Config.haskell) { Invoke-ConfigureHaskell }
    if ($Config.elm)     { Invoke-ConfigureElm }
    if ($Config.racket)  { Invoke-ConfigureRacket }
    if ($Config.rust)    { Invoke-ConfigureRust }
    if ($Config.coq)     { Invoke-ConfigureCoq }
    if ($Config.rlang)   { Invoke-ConfigureRlang }
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

    # This is required for nteract to work:
    $env:JUPYTER_PATH = $env:JUPYTER_DATA_DIR

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

    # Path to local julia modules
    $env:AUCHIMISTE_PATH = "$env:KOMPANION_DIR\src\auchimiste"

    # Install minimal requirements:
    $lockFile = "$env:KOMPANION_DATA\julia.lock"

    if (!(Test-Path $lockFile)) {
        # This will invode setup.jl which may take a long time...
        Invoke-CapturedCommand "$env:JULIA_HOME\bin\julia.exe" @("-e", "exit()")
        New-Item -ItemType File -Path $lockFile -Force | Out-Null
    }
}

function Invoke-ConfigureNode() {
    $env:NODE_HOME = "$env:KOMPANION_BIN\node\node-v24.11.0-win-x64"
    Initialize-AddToPath -Directory "$env:NODE_HOME"
}

function Invoke-ConfigureErlang() {
    $env:ERLANG_HOME = "$env:KOMPANION_BIN\erlang\bin"
    Initialize-AddToPath -Directory "$env:ERLANG_HOME"
}

function Invoke-ConfigureHaskell() {
    $env:STACK_HOME = "$env:KOMPANION_BIN\stack"
    $env:STACK_ROOT = "$env:KOMPANION_DATA\stack"
    Initialize-AddToPath -Directory "$env:KOMPANION_BIN\stack"

    # Install minimal requirements:
    $lockFile = "$env:KOMPANION_DATA\haskell.lock"

    if (!(Test-Path $lockFile)) {
        $stackPath = "$env:STACK_HOME\stack.exe"
        Invoke-CapturedCommand $stackPath @("setup")

        $content = Get-Content -Raw -Path "$env:KOMPANION_SRC\data\stack-config.yaml"
        $content = $content -replace '__STACK_ROOT__', $env:STACK_ROOT
        Set-Content -Path "$env:STACK_ROOT\config.yaml" -Value $content

        # TODO test if this automates install:
        # Invoke-CapturedCommand "stack ghci"
        New-Item -ItemType File -Path $lockFile -Force | Out-Null
    }
}

function Invoke-ConfigureElm() {
    # Elm is at root, no special configuration needed.
}

function Invoke-ConfigureRacket() {
    # $env:RACKET_HOME = "$env:KOMPANION_BIN\racket"
    # Initialize-AddToPath -Directory "$env:RACKET_HOME\bin"
    # $env:PLTUSERHOME     = "$env:KOMPANION_DATA\racket"
    # $env:PLT_PKGDIR      = "$env:PLTUSERHOME\Racket\8.18\pkgs"
}

function Invoke-ConfigureRust() {
    # $env:RUST_HOME = "$env:KOMPANION_BIN\rust"
    # Initialize-AddToPath -Directory "$env:RUST_HOME\bin"
    # $env:CARGO_HOME = "$env:KOMPANION_DATA\rust"
}

function Invoke-ConfigureCoq() {
    $env:COQ_HOME = "$env:KOMPANION_BIN\coq"
    Initialize-AddToPath -Directory "$env:COQ_HOME\bin"
}

function Invoke-ConfigureRlang() {
    $env:RLANG_HOME = "$env:KOMPANION_BIN\rlang"
    Initialize-AddToPath -Directory "$env:RLANG_HOME\bin\x64"

    # Path to R libraries
    $env:R_LIBS_USER = "$env:KOMPANION_DATA\R\4.5"

    # Install minimal requirements:
    $lockFile = "$env:KOMPANION_DATA\rlang.lock"

    if (!(Test-Path $lockFile)) {
        $rscriptPath = "$env:RLANG_HOME\bin\x64\Rscript.exe"
        $repos = "https://pbil.univ-lyon1.fr/CRAN/"

        $installCmd = "install.packages('tidyverse', repos='$repos')"
        Invoke-CapturedCommand $rscriptPath @("-e", $installCmd)

        $installCmd = "install.packages('IRkernel', repos='$repos')"
        Invoke-CapturedCommand $rscriptPath @("-e", $installCmd)

        # Register IRkernel
        $registerCmd = "IRkernel::installspec(user = FALSE)"
        Invoke-CapturedCommand $rscriptPath @("-e", $registerCmd)

        New-Item -ItemType File -Path $lockFile -Force | Out-Null
    }
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------