# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionBaseInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion base installation..."

    if ($Config.vscode)      { Invoke-InstallVsCode }
    if ($Config.sevenzip)    { Invoke-InstallSevenZip }
    if ($Config.zettlr)      { Invoke-InstallZettlr }
    if ($Config.drawio)      { Invoke-InstallDrawio }
    if ($Config.git)         { Invoke-InstallGit }
    if ($Config.nvim)        { Invoke-InstallNvim }
    if ($Config.lessmsi)     { Invoke-InstallLessMsi }
    if ($Config.curl)        { Invoke-InstallCurl }
    if ($Config.msys2)       { Invoke-InstallMsys2 }
    if ($Config.pandoc)      { Invoke-InstallPandoc }
    if ($Config.jabref)      { Invoke-InstallJabRef }
    if ($Config.inkscape)    { Invoke-InstallInkscape }
    if ($Config.miktex)      { Invoke-InstallMikTex }
    if ($Config.nteract)     { Invoke-InstallNteract }
    if ($Config.ffmpeg)      { Invoke-InstallFfmpeg }
    if ($Config.imagemagick) { Invoke-InstallImageMagick }
    if ($Config.poppler)     { Invoke-InstallPoppler }
    if ($Config.quarto)      { Invoke-InstallQuarto }
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallVsCode() {
    $output = "$env:KOMPANION_TEMP\vscode.zip"
    $path   = "$env:KOMPANION_BIN\vscode"
    $url    = "https://update.code.visualstudio.com/latest/win32-x64-archive/stable"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path

}

function Invoke-InstallSevenZip() {
    # Legacy: use full 7zip (from stackage) instead of 7zr!
    # $output = "$env:KOMPANION_TEMP\7zr.exe"
    # $path   = "$env:KOMPANION_BIN\7zr.exe"
    # $url    = "https://github.com/ip7z/7zip/releases/download/25.01/7zr.exe"

    $temp   = "$env:KOMPANION_TEMP\7z"
    $path   = "$env:KOMPANION_BIN\7z"

    if (Test-Path -Path $path) { return }

    if (!(Test-Path -Path $temp)) {
        New-Item -Path $temp -ItemType Directory | Out-Null
    }

    $dl = "https://github.com/commercialhaskell/stackage-content/releases/download/7z-22.01/"
    $files = @("7z.dll", "7z.exe", "License.txt", "readme.txt")

    foreach ($file in $files) {
        $url    = "$dl$file"
        $output = "$temp\$file"
        Invoke-DownloadIfNeeded -URL $url -Output $output
    }

    Move-Item -Path $temp -Destination $path
}

function Invoke-InstallZettlr() {
    $output = "$env:KOMPANION_TEMP\zettlr.exe"
    $temp   = "$env:KOMPANION_TEMP\zettlr_tmp"
    $path   = "$env:KOMPANION_BIN\zettlr"
    $url    = "https://github.com/Zettlr/Zettlr/releases/download/v3.6.0/Zettlr-3.6.0-x64.exe"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output

    $app = Join-Path $temp '$PLUGINSDIR\app-64.7z'
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $temp
    Invoke-Uncompress7zIfNeeded -Source $app    -Destination $path

    Remove-Item -Path $temp -Recurse -Force
}

function Invoke-InstallDrawio() {
    $output = "$env:KOMPANION_TEMP\drawio.zip"
    $path   = "$env:KOMPANION_BIN\drawio"
    $url    = "https://github.com/jgraph/drawio-desktop/releases/download/v29.0.3/draw.io-29.0.3-windows.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallGit() {
    $output = "$env:KOMPANION_TEMP\git.exe  "
    $path   = "$env:KOMPANION_BIN\git"
    $url    = "https://github.com/git-for-windows/git/releases/download/v2.51.0.windows.1/PortableGit-2.51.0-64-bit.7z.exe"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-CapturedCommand $output @("-y", "-o$path")
}

function Invoke-InstallNvim() {
    $output = "$env:KOMPANION_TEMP\nvim.zip"
    $path   = "$env:KOMPANION_BIN\nvim"
    $url    = "https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallLessMsi() {
    $output = "$env:KOMPANION_TEMP\lessmsi.zip"
    $path   = "$env:KOMPANION_BIN\lessmsi"
    $url    = "https://github.com/activescott/lessmsi/releases/download/v2.10.3/lessmsi-v2.10.3.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallCurl() {
    $output = "$env:KOMPANION_TEMP\curl.zip"
    $path   = "$env:KOMPANION_BIN\curl"
    $url    = "https://curl.se/windows/dl-8.16.0_13/curl-8.16.0_13-win64-mingw.zip"

    if (Test-Path -Path $path) { return }

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

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path

}

function Invoke-InstallJabRef() {
    $output = "$env:KOMPANION_TEMP\jabref.zip"
    $path   = "$env:KOMPANION_BIN\jabref"
    $url    = "https://github.com/JabRef/jabref/releases/download/v5.15/JabRef-5.15-portable_windows.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallInkscape() {
    $output = "$env:KOMPANION_TEMP\inkscape.7z"
    $path   = "$env:KOMPANION_BIN\inkscape"
    $url    = "https://inkscape.org/gallery/item/53695/inkscape-1.4_2024-10-11_86a8ad7-x64.7z"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path
}

function Invoke-InstallMikTex() {
    $output  = "$env:KOMPANION_TEMP\miktexsetup.zip"
    $path    = "$env:KOMPANION_BIN\miktexsetup"
    $url     = "https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/miktexsetup-5.5.0+1763023-x64.zip"
    $miktex  = "$env:KOMPANION_BIN\miktex"

    if ((Test-Path -Path $path) -and (Test-Path -Path $miktex)) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path

    $path = "$path\miktexsetup_standalone.exe"
    $pkgData = "$env:KOMPANION_DATA\miktex"

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

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallFfmpeg() {
    $output = "$env:KOMPANION_TEMP\ffmpeg.7z"
    $temp   = "$env:KOMPANION_TEMP\ffmpeg"
    $path   = "$env:KOMPANION_BIN\ffmpeg"
    $url    = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $temp

    Move-Item -Path (Join-Path $temp "ffmpeg-*") -Destination $path
    Remove-Item -Path $temp -Recurse -Force
}

function Invoke-InstallImageMagick() {
    $output = "$env:KOMPANION_TEMP\imagemagick.zip"
    $path   = "$env:KOMPANION_BIN\imagemagick"
    $url    = "https://github.com/ImageMagick/ImageMagick/releases/download/7.1.2-8/ImageMagick-7.1.2-8-portable-Q16-HDRI-x64.7z"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path
}

function Invoke-InstallPoppler() {
    $output = "$env:KOMPANION_TEMP\poppler.zip"
    $path   = "$env:KOMPANION_BIN\poppler"
    $url    = "https://github.com/oschwartz10612/poppler-windows/releases/download/v25.11.0-0/Release-25.11.0-0.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallQuarto() {
    $output = "$env:KOMPANION_TEMP\quarto.zip"
    $path   = "$env:KOMPANION_BIN\quarto"
    $url    = "https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.26/quarto-1.8.26-win.zip"

    if (Test-Path -Path $path) { return }

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------