# ---------------------------------------------------------------------------
# helpers.ps1
# ---------------------------------------------------------------------------

function Test-InPath() {
    param (
        [string]$Directory
    )

    $normalized = $Directory.TrimEnd('\')
    $filtered = ($env:Path -split ';' | ForEach-Object { $_.TrimEnd('\') })
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

function Invoke-CapturedCommand() {
    param (
        [string]$FilePath,
        [string[]]$ArgumentList 
    )

    Start-Process -FilePath $FilePath -ArgumentList $ArgumentList `
        -NoNewWindow -Wait `
        -RedirectStandardOutput "$env:KOMPANION_LOGS\temp-log.out" `
        -RedirectStandardError  "$env:KOMPANION_LOGS\temp-log.err"

    Get-Content "$env:KOMPANION_LOGS\temp-log.out" `
    | Add-Content "$env:KOMPANION_LOGS\kompanion.log"

    Get-Content "$env:KOMPANION_LOGS\temp-log.err" `
    | Add-Content "$env:KOMPANION_LOGS\kompanion.err"
}

function Invoke-DownloadIfNeeded() {
    param (
        [string]$URL,
        [string]$Output
    )

    if (!(Test-Path -Path $Output)) {
        Write-Host "Downloading $URL as $Output"
        Start-BitsTransfer -Source $URL -Destination $Output
    }
}

function Invoke-UncompressZipIfNeeded() {
    param ( 
        [string]$Source,
        [string]$Destination
    )

    if (!(Test-Path -Path $Destination)) {
        Write-Host "Expanding $Source into $Destination"
        Expand-Archive -Path $Source -DestinationPath $Destination
    }
}

function Piperish() {
    $pythonPath = "$env:PYTHON_HOME\python.exe"

    if (Test-Path -Path $pythonPath) {
        $argList = @("-m", "pip", "--trusted-host", "pypi.org",
                     "--trusted-host", "files.pythonhosted.org") + $args
        Invoke-CapturedCommand $pythonPath $argList
    } else {
        Write-Host "Python executable not found!"
    }
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------