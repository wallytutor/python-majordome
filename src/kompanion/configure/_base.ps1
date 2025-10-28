# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionBaseConfigure() {
    Write-Host "- starting Kompanion base configuration..."

    Invoke-ConfigureVsCode
    Invoke-ConfigureGit
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

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------