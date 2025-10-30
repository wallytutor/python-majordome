# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionBaseConfigure() {
    Write-Host "- starting Kompanion base configuration..."

    Invoke-ConfigureVsCode
    Invoke-ConfigureGit
    Invoke-ConfigureNvim
    Invoke-ConfigureSevenZip
    Invoke-ConfigureLessMsi
    Invoke-ConfigureMsys2
    Invoke-ConfigurePandoc
    Invoke-ConfigureJabRef
    Invoke-ConfigureInkscape
    Invoke-ConfigureMikTex
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-ConfigureVsCode() {
    $env:VSCODE_HOME       = "$env:KOMPANION_BIN\vscode"
    $env:VSCODE_EXTENSIONS = "$env:KOMPANION_DATA\vscode\extensions"
    $env:VSCODE_SETTINGS   = "$env:KOMPANION_DATA\vscode\user-data"
    Initialize-AddToPath -Directory "$env:VSCODE_HOME"
}

function Invoke-ConfigureGit() {
    $env:GIT_HOME = "$env:KOMPANION_BIN\git"
    Initialize-AddToPath -Directory "$env:GIT_HOME\cmd"
}

function Invoke-ConfigureNvim() {
    $env:NVIM_HOME = "$env:KOMPANION_BIN\nvim\nvim-win64\bin"
    Initialize-AddToPath -Directory "$env:NVIM_HOME"
}

function Invoke-ConfigureSevenZip() {
    $env:SEVENZIP_HOME = "$env:KOMPANION_BIN"
    Initialize-AddToPath -Directory "$env:SEVENZIP_HOME"
}

function Invoke-ConfigureLessMsi() {
    $env:LESSMSI_HOME = "$env:KOMPANION_BIN\lessmsi"
    Initialize-AddToPath -Directory "$env:LESSMSI_HOME"
}

function Invoke-ConfigureCurl() {
    $env:CURl_HOME = "$env:KOMPANION_BIN\curl\curl-8.16.0_13-win64-mingw\bin"
    Initialize-AddToPath -Directory "$env:CURl_HOME"
}

function Invoke-ConfigureMsys2() {
    # TODO once MSYS2 is installed!
}

function Invoke-ConfigurePandoc() {
    $env:PANDOC_HOME = "$env:KOMPANION_BIN\pandoc\pandoc-3.8"
    Initialize-AddToPath -Directory "$env:PANDOC_HOME"
}

function Invoke-ConfigureJabRef() {
    $env:JABREF_HOME = "$env:KOMPANION_BIN\jabref\JabRef"
    Initialize-AddToPath -Directory "$env:JABREF_HOME"
}

function Invoke-ConfigureInkscape() {
    $env:INKSCAPE_HOME = "$env:KOMPANION_BIN\inkscape\inkscape\bin"
    Initialize-AddToPath -Directory "$env:INKSCAPE_HOME"
}

function Invoke-ConfigureMikTex() {
    $env:MIKTEX_HOME = "$env:KOMPANION_BIN\miktex"
    Initialize-AddToPath -Directory "$env:MIKTEX_HOME"

    $path = "$env:MIKTEX_HOME\miktex-portable.cmd"
    Start-Process -FilePath $path -NoNewWindow

    Initialize-AddToPath -Directory "$env:MIKTEX_HOME\texmfs\install\miktex\bin\x64\internal"
    Initialize-AddToPath -Directory "$env:MIKTEX_HOME\texmfs\install\miktex\bin\x64"
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------