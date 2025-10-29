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
    # XXX: check if ELMER_HOME has any special meaning, otherwise add
    # \bin directly to its definition (I think I cannot do that...).
    $env:ELMER_HOME = "$env:KOMPANION_BIN\elmer\ElmerFEM-gui-mpi-Windows-AMD64"
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