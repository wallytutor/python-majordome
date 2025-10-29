# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionSimuInstall() {
    Write-Host "- starting Kompanion simulation tools installation..."

    Invoke-InstallElmer
    Invoke-InstallGmsh
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallElmer() {
    $output = "$env:KOMPANION_TEMP\elmer.zip"
    $path   = "$env:KOMPANION_BIN\elmer"
    $url    = "https://www.nic.funet.fi/pub/sci/physics/elmer/bin/windows/ElmerFEM-gui-mpi-Windows-AMD64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallGmsh() {
    $output = "$env:KOMPANION_TEMP\gmsh.zip"
    $path   = "$env:KOMPANION_BIN\gmsh"
    $url    =  "https://gmsh.info/bin/Windows/gmsh-4.14.1-Windows64-sdk.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------