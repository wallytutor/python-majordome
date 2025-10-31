# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionSimuInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion simulation tools installation..."

    # No configure (not in path):
    if ($Config.paraview) { Invoke-InstallParaView }
    if ($Config.freecad)  { Invoke-InstallFreeCAD }
    if ($Config.blender)  { Invoke-InstallBlender }

    # With configure:
    if ($Config.elmer)    { Invoke-InstallElmer }
    if ($Config.gmsh)     { Invoke-InstallGmsh }
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallParaView() {
    $output = "$env:KOMPANION_TEMP\paraview.zip"
    $path   = "$env:KOMPANION_BIN\paraview"
    $url    = "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.0&type=binary&os=Windows&downloadFile=ParaView-6.0.1-Windows-Python3.12-msvc2017-AMD64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallFreeCAD() {
    $output = "$env:KOMPANION_TEMP\freecad.7z"
    $path   = "$env:KOMPANION_BIN\freecad"
    $url    = "https://github.com/FreeCAD/FreeCAD/releases/download/1.0.2/FreeCAD_1.0.2-conda-Windows-x86_64-py311.7z"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path
}

function Invoke-InstallBlender() {
    $output = "$env:KOMPANION_TEMP\blender.zip"
    $path   = "$env:KOMPANION_BIN\blender"
    $url    = "https://ftp.halifax.rwth-aachen.de/blender/release/Blender4.5/blender-4.5.4-windows-x64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

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