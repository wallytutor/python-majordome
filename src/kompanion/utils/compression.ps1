# ---------------------------------------------------------------------------
# compression.ps1
# ---------------------------------------------------------------------------

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

function Invoke-UncompressMsiIfNeeded() {
    param (
        [string]$Source,
        [string]$Destination
    )

    if (!(Test-Path -Path $Destination)) {
        if (Test-Path "$env:LESSMSI_HOME\lessmsi.exe") {
            $lessMsiPath = "$env:LESSMSI_HOME\lessmsi.exe"
        } else {
            $lessMsiPath = "lessmsi.exe"
        }

        Invoke-CapturedCommand $lessMsiPath @("x", $Source , "$Destination\")
    }
}

# elseif ($Method -eq "TAR") {
#     New-Item -Path "$Destination" -ItemType Directory
#     tar -xzf $Source -C $Destination

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------