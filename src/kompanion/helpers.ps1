# ---------------------------------------------------------------------------
# helpers.ps1
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

        try {
            # XXX: -ErrorAction Stop is required to catch errors
            Start-BitsTransfer -Source $URL -Destination $Output -ErrorAction Stop
        } catch {
            # Invoke-WebRequest -Uri $URL -OutFile $Output --> TOO SLOW
            curl.exe --ssl-no-revoke  $URL --output $Output
        }
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

function Invoke-Uncompress7zIfNeeded() {
    param (
        [string]$Source,
        [string]$Destination
    )

    if (!(Test-Path -Path $Destination)) {
        Write-Host "Expanding $Source into $Destination"

        if (Test-Path "$env:SEVENZIP_HOME\7z.exe") {
            $sevenZipPath = "$env:SEVENZIP_HOME\7z.exe"
        } else {
            $sevenZipPath = "7zr.exe"
        }

        Invoke-CapturedCommand $sevenZipPath @("x", $Source , "-o$Destination")
    }
}

function Invoke-UncompressGzipIfNeeded() {
    param(
        [string]$Source,
        [string]$Destination
    )

    $inputf  = [IO.File]::OpenRead($Source)
    $output = [IO.File]::Create($Destination)

    $what   = [IO.Compression.CompressionMode]::Decompress
    $gzip   = New-Object IO.Compression.GzipStream($inputf, $what)

    $buffer = New-Object byte[] 4096
    while (($read = $gzip.Read($buffer, 0, $buffer.Length)) -gt 0) {
        $output.Write($buffer, 0, $read)
    }

    $gzip.Dispose()
    $output.Dispose()
    $inputf.Dispose()
}

# elseif ($Method -eq "TAR") {
#     New-Item -Path "$Destination" -ItemType Directory
#     tar -xzf $Source -C $Destination
# elseif ($Method -eq "MSI") {
#     Write-Host "Installing MSI package $Source ... $Destination"
#     Invoke-CapturedCommand "lessmsi.exe" @("x", $Source , "$Destination\")

function Invoke-DirectoryBackupNoAdmin() {
    param (
        [string]$Source,
        [string]$Destination,
        [switch]$TestOnly
    )

    $LogFile = "$Destination.log"

    $RoboArgs = @(
        $Source
        $Destination
        "/MIR"          # Mirror (copy + delete)
        "/R:3"          # Retry 3 times
        "/W:5"          # Wait 5 seconds between retries
        "/COPY:DAT"     # Copy file info (data, attributes, timestamps)
        "/DCOPY:DAT"    # Copy directory data, attributes, timestamps
        "/MT:16"        # Multi-threaded copy (16 threads)
        "/LOG:$LogFile" # Log output
    )

    if ($TestOnly) { $RoboArgs += @("/L") }

    robocopy @RoboArgs
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
# Module management
# ---------------------------------------------------------------------------

function Get-ModulesConfig() {
    $path = "$env:KOMPANION_DATA\kompanion.json"

    if (!(Test-Path -Path $path)) {
        Write-Host "Using default modules configuration..."
        $path = "$env:KOMPANION_SRC\data\kompanion.json"
    }

    return Get-Content -Path $path -Raw | ConvertFrom-Json
}

function Enable-Module() {
    # Change key in kompanion.json
    Write-Host "Sorry, WIP..."
}

function Show-ModuleList() {
    Write-Host "Sorry, WIP..."
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------