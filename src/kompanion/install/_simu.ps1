# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionSimuInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion simulation tools installation..."

    # No configure (not in path):
    if ($Config.paraview)  { Invoke-InstallParaView }
    if ($Config.freecad)   { Invoke-InstallFreeCAD }
    if ($Config.blender)   { Invoke-InstallBlender }
    if ($Config.meshlab)   { Invoke-InstallMeshLab }
    if ($Config.dwsim)     { Invoke-InstallDwsim }

    # With configure:
    if ($Config.elmer)     { Invoke-InstallElmer }
    if ($Config.gmsh)      { Invoke-InstallGmsh }
    if ($Config.su2)       { Invoke-InstallSu2 }
    if ($Config.tesseract) { Invoke-InstallTesseract }
    if ($Config.radcal)    { Invoke-InstallRadcal }
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallParaView() {
    $output = "$env:KOMPANION_TEMP\paraview.zip"
    $path   = "$env:KOMPANION_BIN\paraview"
    $url    = "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.0&type=binary&os=Windows&downloadFile=ParaView-6.0.1-Windows-Python3.12-msvc2017-AMD64.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallFreeCAD() {
    $output = "$env:KOMPANION_TEMP\freecad.7z"
    $path   = "$env:KOMPANION_BIN\freecad"
    $url    = "https://github.com/FreeCAD/FreeCAD/releases/download/1.0.2/FreeCAD_1.0.2-conda-Windows-x86_64-py311.7z"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path

    $output = "$env:KOMPANION_TEMP\odafileconverter.msi"
    $path   = "$env:KOMPANION_BIN\odafileconverter"
    $url    = "https://www.opendesign.com/guestfiles/get?filename=ODAFileConverter_QT6_vc16_amd64dll_26.10.msi"

    # TODO: not working because of page redirection
    # Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressMsiIfNeeded -Source $output -Destination $path
}

function Invoke-InstallBlender() {
    $output = "$env:KOMPANION_TEMP\blender.zip"
    $path   = "$env:KOMPANION_BIN\blender"
    $url    = "https://ftp.halifax.rwth-aachen.de/blender/release/Blender4.5/blender-4.5.4-windows-x64.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallMeshLab() {
    $output = "$env:KOMPANION_TEMP\meshlab.zip"
    $path   = "$env:KOMPANION_BIN\meshlab"
    $url    = "https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-2025.07/MeshLab2025.07-windows_x86_64.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallDwsim() {
    $output = "$env:KOMPANION_TEMP\dwsim.zip"
    $path   = "$env:KOMPANION_BIN\dwsim"
    $url    = "https://github.com/DanWBR/dwsim/releases/download/v9.0.4/DWSIM_v904_win64_portable.7z"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path
}

function Invoke-InstallRadcal() {
    $output = "$env:KOMPANION_TEMP\fds_smv.exe"
    $temp   = "$env:KOMPANION_TEMP\fds_smv"
    $path   = "$env:KOMPANION_BIN\firemodels"
    $url    = "https://github.com/firemodels/fds/releases/download/FDS-6.10.1/FDS-6.10.1_SMV-6.10.1_win.exe"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $temp

    Move-Item -Path "$temp\firemodels" -Destination $path
    Remove-Item -Path $temp -Recurse -Force

    $output = "$path\radcal.exe"
    $url    = "https://github.com/firemodels/radcal/releases/download/v2.0/radcal_win_64.exe"
    Invoke-DownloadIfNeeded -URL $url -Output $output
}

function Invoke-InstallElmer() {
    $output = "$env:KOMPANION_TEMP\elmer.zip"
    $path   = "$env:KOMPANION_BIN\elmer"
    $url    = "https://www.nic.funet.fi/pub/sci/physics/elmer/bin/windows/ElmerFEM-gui-mpi-Windows-AMD64.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallGmsh() {
    $output = "$env:KOMPANION_TEMP\gmsh.zip"
    $path   = "$env:KOMPANION_BIN\gmsh"
    $url    =  "https://gmsh.info/bin/Windows/gmsh-4.14.1-Windows64-sdk.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallSu2() {
    $output = "$env:KOMPANION_TEMP\su2.zip"
    $path   = "$env:KOMPANION_TEMP\su2"
    $url    = "https://github.com/su2code/SU2/releases/download/v8.3.0/SU2-v8.3.0-win64-mpi.zip"

    # XXX: there is a second file inside it! Check!
    $innerOutput = "$env:KOMPANION_TEMP\su2\win64-mpi.zip"
    $finalPath   = "$env:KOMPANION_BIN\su2"

    if (Test-Path -Path $finalPath) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output      -Destination $path
    Invoke-UncompressZipIfNeeded -Source $innerOutput -Destination $finalPath
}

function Invoke-InstallTesseract() {
    $output = "$env:KOMPANION_TEMP\tesseract.exe"
    $path   = "$env:KOMPANION_BIN\tesseract"
    $url    = "https://github.com/tesseract-ocr/tesseract/releases/download/5.5.0/tesseract-ocr-w64-setup-5.5.0.20241111.exe"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path

    $target = Join-Path $path '$PLUGINSDIR'
    if (Test-Path $target) { Remove-Item $target -Recurse -Force }

    $path = "$env:KOMPANION_BIN\tessdata"

    if (-not (Test-Path "$path")) {
        git clone "https://github.com/tesseract-ocr/tessdata_best.git" "$path"
    }
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------