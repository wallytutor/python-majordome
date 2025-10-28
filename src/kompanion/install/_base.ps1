# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionBaseInstall() {
    Write-Host "- starting Kompanion base installation..."

    Invoke-InstallVsCode
    Invoke-InstallGit
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallVsCode() {
    $output = "$env:KOMPANION_TEMP\vscode.zip"
    $path   = "$env:KOMPANION_BIN\vscode"
    $url    = "https://update.code.visualstudio.com/latest/win32-x64-archive/stable"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallGit() {
    $output = "$env:KOMPANION_TEMP\git.exe  "
    $path   = "$env:KOMPANION_BIN\git"
    $url    = "https://github.com/git-for-windows/git/releases/download/v2.51.0.windows.1/PortableGit-2.51.0-64-bit.7z.exe"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    
    if (!(Test-Path -Path $path)) {
        Write-Host "Expanding $output into $path"
        Invoke-CapturedCommand $output @("-y", "-o$path")
    }
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------