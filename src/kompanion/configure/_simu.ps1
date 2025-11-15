# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionSimuConfigure() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion simulation tools configuration..."

    if ($Config.elmer)     { Invoke-ConfigureElmer }
    if ($Config.gmsh)      { Invoke-ConfigureGmsh }
    if ($Config.su2)       { Invoke-ConfigureSu2 }
    if ($Config.tesseract) { Invoke-ConfigureTesseract }
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-ConfigureElmer() {
    $env:ELMER_HOME = "$env:KOMPANION_BIN\elmer\ElmerFEM-gui-mpi-Windows-AMD64"
    $env:ELMER_GUI_HOME = "$env:ELMER_HOME\share\ElmerGUI"
    Initialize-AddToPath -Directory "$env:ELMER_HOME\lib"
    Initialize-AddToPath -Directory "$env:ELMER_HOME\bin"
}

function Invoke-ConfigureGmsh() {
    $env:GMSH_HOME = "$env:KOMPANION_BIN\gmsh\gmsh-4.14.1-Windows64-sdk"
    Initialize-AddToPath -Directory "$env:GMSH_HOME\lib"
    Initialize-AddToPath -Directory "$env:GMSH_HOME\bin"
    # TODO add to PYTHONPATH;JULIA_LOAD_PATH
}

function Invoke-ConfigureSu2() {
    $env:SU2_HOME = "$env:KOMPANION_BIN\su2"
    Initialize-AddToPath -Directory "$env:SU2_HOME\bin"
    # TODO add to PYTHONPATH;JULIA_LOAD_PATH
}

function Invoke-ConfigureTesseract() {
    $env:TESSERACT_HOME = "$env:KOMPANION_BIN\tesseract"
    $env:TESSDATA_PREFIX = "$env:KOMPANION_BIN\tessdata"
    Initialize-AddToPath -Directory "$env:TESSERACT_HOME"
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------