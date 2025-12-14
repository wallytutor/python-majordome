# ---------------------------------------------------------------------------
# Parameters
# ---------------------------------------------------------------------------

param (
    [switch]$RebuildOnStart,
    [switch]$RunVsCode
)

# ---------------------------------------------------------------------------
# Caller
# ---------------------------------------------------------------------------

function Start-KompanionMain() {
    Write-Output "Starting Kompanion from $PSScriptRoot!"

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

    # Fake user profile to avoid applications access:
    $env:USERPROFILE = "$env:KOMPANION_DATA\user"

    # Ensure important directories exist:
    Initialize-EnsureDirectory $env:KOMPANION_BIN
    Initialize-EnsureDirectory $env:KOMPANION_DATA
    Initialize-EnsureDirectory $env:KOMPANION_LOGS
    Initialize-EnsureDirectory $env:KOMPANION_TEMP
    Initialize-EnsureDirectory $env:USERPROFILE

    # Get configuration of modules:
    $config = Get-ModulesConfig

    # Install components if needed
    if ($RebuildOnStart) {
        Start-KompanionInstall $config
    }

    # Configure components if needed
    Start-KompanionConfigure $config

    Write-Output "`nEnvironment"
    Write-Output "-----------"
    Write-Output "KOMPANION_DIR       $env:KOMPANION_DIR"
    Write-Output "KOMPANION_BIN       $env:KOMPANION_BIN"
    Write-Output "KOMPANION_DATA      $env:KOMPANION_DATA"
    Write-Output "KOMPANION_LOGS      $env:KOMPANION_LOGS"
    Write-Output "KOMPANION_TEMP      $env:KOMPANION_TEMP"

    Write-Output "`nOther paths"
    Write-Output "-----------"
    Write-Output "VSCODE_HOME         $env:VSCODE_HOME"
    Write-Output "VSCODE_EXTENSIONS   $env:VSCODE_EXTENSIONS"
    Write-Output "VSCODE_SETTINGS     $env:VSCODE_SETTINGS"
    Write-Output "GIT_HOME            $env:GIT_HOME"

    # Run Kompanion VS Code instance
    if ($RunVsCode) {
        Code.exe --extensions-dir $env:VSCODE_EXTENSIONS `
                 --user-data-dir  $env:VSCODE_SETTINGS  .
    }
}

# ---------------------------------------------------------------------------
# Modules
# ---------------------------------------------------------------------------

function Start-KompanionInstall() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "`nStarting Kompanion installation..."

    . "$PSScriptRoot\install\_base.ps1"
    . "$PSScriptRoot\install\_lang.ps1"
    . "$PSScriptRoot\install\_simu.ps1"

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    Start-KompanionBaseInstall $Config.base
    Start-KompanionLangInstall $Config.lang
    Start-KompanionSimuInstall $Config.simu
}

function Start-KompanionConfigure() {
    param (
        [pscustomobject]$Config
    )

    Write-Host "`nStarting Kompanion configuration..."

    . "$PSScriptRoot\configure\_base.ps1"
    . "$PSScriptRoot\configure\_lang.ps1"
    . "$PSScriptRoot\configure\_simu.ps1"

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    Start-KompanionBaseConfigure $Config.base
    Start-KompanionLangConfigure $Config.lang
    Start-KompanionSimuConfigure $Config.simu
}

function KompanionSource {
    . "$env:KOMPANION_SRC/main.ps1"
}

function KompanionRebuild {
    . "$env:KOMPANION_SRC/main.ps1" -RebuildOnStart
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