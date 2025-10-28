# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionLangInstall() {
    Write-Host "- starting Kompanion languages installation..."

    Invoke-InstallPython
    Invoke-InstallJulia
    Invoke-InstallErlang
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

function Invoke-InstallErlang() {
    $output = "$env:KOMPANION_TEMP\erlang.zip"
    $path   = "$env:KOMPANION_BIN\erlang"
    $url    = "https://github.com/erlang/otp/releases/download/OTP-27.3.4.4/otp_win64_27.3.4.4.zip"

    Invoke-DownloadIfNeeded -URL $url -Output $output
    Invoke-UncompressZipIfNeeded -Source $output -Destination $path
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------