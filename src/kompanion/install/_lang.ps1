# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionLangInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "- starting Kompanion languages installation..."

    if ($Config.python)  { Invoke-InstallPython }
    if ($Config.julia)   { Invoke-InstallJulia }
    if ($Config.node)    { Invoke-InstallNode }
    if ($Config.erlang)  { Invoke-InstallErlang }
    if ($Config.haskell) { Invoke-InstallHaskell }
    if ($Config.elm)     { Invoke-InstallElm }
    if ($Config.racket)  { Invoke-InstallRacket }
    if ($Config.rust)    { Invoke-InstallRust }
    if ($Config.coq)     { Invoke-InstallCoq }
    if ($Config.rlang)   { Invoke-InstallRlang }
}

# ---------------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------------

function Invoke-InstallPython() {
    $output = "$env:KOMPANION_TEMP\python.zip"
    $path   = "$env:KOMPANION_BIN\python"
    $url    = "https://github.com/winpython/winpython/releases/download/17.2.20251012/WinPython64-3.13.8.0dotb1.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallJulia() {
    $output = "$env:KOMPANION_TEMP\julia.zip"
    $path   = "$env:KOMPANION_BIN\julia"
    $url    = "https://julialang-s3.julialang.org/bin/winnt/x64/1.12/julia-1.12.1-win64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallNode() {
    $output = "$env:KOMPANION_TEMP\node.zip"
    $path   = "$env:KOMPANION_BIN\node"
    $url    = "https://nodejs.org/dist/v24.11.0/node-v24.11.0-win-x64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallErlang() {
    $output = "$env:KOMPANION_TEMP\erlang.zip"
    $path   = "$env:KOMPANION_BIN\erlang"
    $url    = "https://github.com/erlang/otp/releases/download/OTP-27.3.4.4/otp_win64_27.3.4.4.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallHaskell() {
    $output = "$env:KOMPANION_TEMP\stack.zip"
    $path   = "$env:KOMPANION_BIN\stack"
    $url    = "https://github.com/commercialhaskell/stack/releases/download/v3.7.1/stack-3.7.1-windows-x86_64.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallElm() {
    $output = "$env:KOMPANION_TEMP\elm.gz"
    $path   = "$env:KOMPANION_BIN\elm.exe"
    $url    = "https://github.com/elm/compiler/releases/download/0.19.1/binary-for-windows-64-bit.gz"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressGzipIfNeeded -Source $output -Destination $path
}

function Invoke-InstallRacket() {
    Write-Host "- Racket installation not yet implemented."
}

function Invoke-InstallRust() {
    Write-Host "- Rust installation not yet implemented."
}

function Invoke-InstallCoq() {
    $output = "$env:KOMPANION_TEMP\coq.zip"
    $path   = "$env:KOMPANION_BIN\coq"
    $url    = "https://github.com/rocq-prover/platform/releases/download/2025.01.0/Coq-Platform-release-2025.01.0-version.8.20.2025.01-Windows-x86_64.exe"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-Uncompress7zIfNeeded -Source $output -Destination $path

    $target = Join-Path $path '$PLUGINSDIR'
    if (Test-Path $target) { Remove-Item $target -Recurse -Force }

    $target = Join-Path $path 'Uninstall.exe.nsis'
    if (Test-Path $target) { Remove-Item $target }
}

function Invoke-InstallRlang() {
    $output = "$env:KOMPANION_TEMP\R-4.5.2-win.exe"
    $path   = "$env:KOMPANION_BIN\rlang"
    $url    = "https://cran.asnr.fr/bin/windows/base/R-4.5.2-win.exe"

    Invoke-DownloadIfNeeded -URL $url -Output $output

    $arglist = @(
        "/VERYSILENT",
        "/SUPPRESSMSGBOXES",
        "/NORESTART",
        "/DIR=$path"
    )

    Start-Process -FilePath $output -ArgumentList $arglist -Wait
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------