# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionSimuConfigure() {
    Write-Host "- starting Kompanion simulation tools configuration..."

    Invoke-ConfigureElmer
    Invoke-ConfigureGmsh
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

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------