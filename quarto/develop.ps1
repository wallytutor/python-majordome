# ----------------------------------------------------------------------------
# Parameters
# ----------------------------------------------------------------------------

param (
    [switch]$TestQuarto,
    [switch]$Render,
    [switch]$Clean
)

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------

function Get-StatusMessage {
    param( [string]$Message = "" )

    if ($LASTEXITCODE -eq 0) {
        Write-Good ">>> Success!"
        if ($Message) { Write-Good $Message }
        return $true
    } else {
        Write-Bad ">>> Failed!"
        if ($Message) { Write-Bad $Message }
        return $false
    }
}

function Test-Quarto {
    Write-Head "`nChecking for Quarto..."
    $version = quarto --version 2>$null

    if ($LASTEXITCODE -eq 0) {
        $out = "Quarto found: $version"
    } else {
        $out = "Quarto not found! Please install Quarto..."
    }

    & quarto check > log.quarto 2>&1

    return Get-StatusMessage -Message $out
}

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------

if (-not (Initialize-VirtualEnvironment -VenvRoot $PSScriptRoot)) {
    exit 1
}

if ($TestQuarto) {
    Write-Head "`nChecking for required tools..."

    if (-not (Test-Quarto)) {
        exit 1
    }

    Write-Good "`n=== Build tools ready ==="
}

if ($Clean) {
    Write-Head "`nCleaning Quarto output..."
    Remove-Item -Recurse -Force "_book"
    Remove-Item -Recurse -Force ".quarto"
}

if ($Render) {
    quarto preview --no-browser --port 2505
}

# ----------------------------------------------------------------------------
# EOF
# ----------------------------------------------------------------------------