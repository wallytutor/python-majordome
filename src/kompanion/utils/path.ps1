# ---------------------------------------------------------------------------
# path.ps1
# ---------------------------------------------------------------------------

function Test-InPath() {
    param (
        [string]$Directory,
        [string]$Path = $env:Path
    )

    $normalized = $Directory.TrimEnd('\')
    $filtered = ($Path -split ';' | ForEach-Object { $_.TrimEnd('\') })
    return $filtered -contains $normalized
}

function Initialize-EnsureDirectory() {
    param (
        [string]$Path
    )

    if (!(Test-Path -Path $Path)) {
        New-Item -ItemType Directory -Path $Path
    }
}

function Initialize-AddToPath() {
    param (
        [string]$Directory
    )

    if (Test-Path -Path $Directory) {
        if (!(Test-InPath $Directory)) {
            $env:Path = "$Directory;" + $env:Path
        }
    } else {
        Write-Host "Not prepeding missing path to environment: $Directory"
    }
}

function Initialize-AddToManPath() {
    param (
        [string]$Directory
    )

    # Notice that PS man is just Get-Help and this will have no effect there.
    # TODO: figure out how to get actual man working everywhere in PS.
    if (Test-Path -Path $Directory) {
        if (!(Test-InPath -Directory $Directory -Path $env:MANPATH)) {
            $env:MANPATH = "$Directory;" + $env:MANPATH
        }
    } else {
        Write-Host "Not prepeding missing path to environment: $Directory"
    }
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------