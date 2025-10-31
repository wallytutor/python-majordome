# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionBaseInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion base installation..."

    if ($Config.vscode)   { Invoke-InstallVsCode }
    if ($Config.git)      { Invoke-InstallGit }
    if ($Config.nvim)     { Invoke-InstallNvim }
    if ($Config.sevenzip) { Invoke-InstallSevenZip }
    if ($Config.lessmsi)  { Invoke-InstallLessMsi }
    if ($Config.curl)     { Invoke-InstallCurl }
    if ($Config.msys2)    { Invoke-InstallMsys2 }
    if ($Config.pandoc)   { Invoke-InstallPandoc }
    if ($Config.jabref)   { Invoke-InstallJabRef }
    if ($Config.inkscape) { Invoke-InstallInkscape }
    if ($Config.miktex)   { Invoke-InstallMikTex }
    if ($Config.nteract)  { Invoke-InstallNteract }
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

function Invoke-InstallNvim() {
    $output = "$env:KOMPANION_TEMP\nvim.zip"
    $path   = "$env:KOMPANION_BIN\nvim"
    $url    = "https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallSevenZip() {
    # TODO use full 7zip instead of 7zr ASAP!
    $output = "$env:KOMPANION_TEMP\7zr.exe"
    $path   = "$env:KOMPANION_BIN\7zr.exe"
    $url    = "https://github.com/ip7z/7zip/releases/download/25.01/7zr.exe"

    Invoke-DownloadIfNeeded -URL $url -Output $output

    if (!(Test-Path -Path $path)) {
        Write-Host "Expanding $output into $path"
        Copy-Item -Path $output -Destination $path
    }
}

function Invoke-InstallLessMsi() {
    $output = "$env:KOMPANION_TEMP\lessmsi.zip"
    $path   = "$env:KOMPANION_BIN\lessmsi"
    $url    = "https://github.com/activescott/lessmsi/releases/download/v2.10.3/lessmsi-v2.10.3.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallCurl() {
    $output = "$env:KOMPANION_TEMP\curl.zip"
    $path   = "$env:KOMPANION_BIN\curl"
    $url    = "https://curl.se/windows/dl-8.16.0_13/curl-8.16.0_13-win64-mingw.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallMsys2() {
    Write-Host "- installing MSYS2 (not yet implemented)..."
    # $output = Get-KompanionPath $$config.install.msys2.saveAs
    # $path   = Get-KompanionPath $$config.install.msys2.path
    # Invoke-DownloadIfNeeded -URL $$config.install.msys2.URL -Output $output

    # if (Test-Path -Path $path) {
    #     Write-Host "Skipping extraction of $output..."
    # } else {
    #     Write-Host "Expanding $output into $path"
    #     $argList = @("in", "--confirm-command", "--accept-messages"
    #                  "--root", "$path")
    #     Invoke-CapturedCommand $output $argList
    # }

    # $bash = Get-KompanionPath "bin\msys2\usr\bin\bash"
    # $argList = @("-lc", "'pacman -Syu --noconfirm'")
    # $argList = @("-lc", "'pacman -Su --noconfirm'")
    # bin\msys2\usr\bin\bash -lc "pacman -Syu --noconfirm"
    # bin\msys2\usr\bin\bash -lc "pacman -Su --noconfirm"
    # pacman-key --init && pacman-key --populate msys2
    # pacman -Syuu && pacman -S bash coreutils make gcc p7zip
    # pacman -Sy --noconfirm; pacman -S --noconfirm p7zip
}

function Invoke-InstallPandoc() {
    $output = "$env:KOMPANION_TEMP\pandoc.zip"
    $path   = "$env:KOMPANION_BIN\pandoc"
    $url    =  "https://github.com/jgm/pandoc/releases/download/3.8/pandoc-3.8-windows-x86_64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path

}

function Invoke-InstallJabRef() {
    $output = "$env:KOMPANION_TEMP\jabref.zip"
    $path   = "$env:KOMPANION_BIN\jabref"
    $url    = "https://github.com/JabRef/jabref/releases/download/v5.15/JabRef-5.15-portable_windows.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallInkscape() {
    $output = "$env:KOMPANION_TEMP\inkscape.7z"
    $path   = "$env:KOMPANION_BIN\inkscape"
    $url    = "https://inkscape.org/gallery/item/53695/inkscape-1.4_2024-10-11_86a8ad7-x64.7z"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path
}

function Invoke-InstallMikTex() {
    $output  = "$env:KOMPANION_TEMP\miktexsetup.zip"
    $path    = "$env:KOMPANION_BIN\miktexsetup"
    $url     = "https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/miktexsetup-5.5.0+1763023-x64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path

    $path = "$path\miktexsetup_standalone.exe"
    $pkgData = "$env:KOMPANION_DATA\miktex"
    $miktex  = "$env:KOMPANION_BIN\miktex"

    if (!(Test-Path -Path $pkgData)) {
        Write-Host "Downloading MikTex data to $pkgData"
        $argList = @("download", "--package-set", "basic",
                     "--local-package-repository", $pkgData)
        Invoke-CapturedCommand $path $argList
    }

    if (!(Test-Path -Path $miktex)) {
        Write-Host "Installing MikTex data to $miktex"
        $argList = @("install", "--package-set", "basic",
                    "--local-package-repository", $pkgData,
                    "--portable", $miktex)
        Invoke-CapturedCommand $path $argList
    }
}

function Invoke-InstallNteract() {
    $output = "$env:KOMPANION_TEMP\nteract.zip"
    $path   = "$env:KOMPANION_BIN\nteract"
    $url    = "https://github.com/nteract/nteract/releases/download/v0.28.0/nteract-0.28.0-win.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------