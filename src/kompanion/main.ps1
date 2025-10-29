# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionMain() {
    param ()

    # Path to the root directory:
    $env:KOMPANION_DIR = (Get-Item $PSScriptRoot).Parent.Parent.FullName

    # Paths to important subdirectories:
    $env:KOMPANION_SRC  = "$env:KOMPANION_DIR\src\kompanion"
    $env:KOMPANION_PKG  = "$env:KOMPANION_DIR\local\pkg"

    # Path to automatic subdirectories:
    $env:KOMPANION_BIN  = "$env:KOMPANION_DIR\local\bin"
    $env:KOMPANION_DATA = "$env:KOMPANION_DIR\local\data"
    $env:KOMPANION_LOGS = "$env:KOMPANION_DIR\local\logs"
    $env:KOMPANION_TEMP = "$env:KOMPANION_DIR\local\temp"

    # Ensure important directories exist:
    Initialize-EnsureDirectory $env:KOMPANION_BIN
    Initialize-EnsureDirectory $env:KOMPANION_DATA
    Initialize-EnsureDirectory $env:KOMPANION_LOGS
    Initialize-EnsureDirectory $env:KOMPANION_TEMP

    # Install components if needed
    Start-KompanionInstall

    # Configure components if needed
    Start-KompanionConfigure

    # Run Kompanion VS Code instance
    Code.exe --extensions-dir $env:VSCODE_EXTENSIONS `
             --user-data-dir  $env:VSCODE_SETTINGS  .
}

# ---------------------------------------------------------------------------
# Modules
# ---------------------------------------------------------------------------

function Start-KompanionInstall() {
    Write-Host "`nStarting Kompanion installation!"

    . "$PSScriptRoot\install\_base.ps1"
    . "$PSScriptRoot\install\_lang.ps1"

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    Start-KompanionBaseInstall
    Start-KompanionLangInstall
}

function Start-KompanionConfigure() {
    Write-Host "`nStarting Kompanion configuration..."

    . "$PSScriptRoot\configure\_base.ps1"
    . "$PSScriptRoot\configure\_lang.ps1"

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    Start-KompanionBaseConfigure
    Start-KompanionLangConfigure
}

# ---------------------------------------------------------------------------
# Main entry point
# ---------------------------------------------------------------------------

. "$PSScriptRoot/aliases.ps1"
. "$PSScriptRoot/helpers.ps1"

Start-KompanionMain

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------