# ---------------------------------------------------------------------------
# helpers.ps1
# ---------------------------------------------------------------------------

. "$PSScriptRoot/utils/messages.ps1"
. "$PSScriptRoot/utils/path.ps1"
. "$PSScriptRoot/utils/compression.ps1"
. "$PSScriptRoot/utils/python.ps1"

# ---------------------------------------------------------------------------
# Others
# ---------------------------------------------------------------------------

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

function Rename-FilesToStandard {
    <#
    .SYNOPSIS
        Renames files to use lowercase and ASCII-safe characters.

    .DESCRIPTION
        Recursively renames files in the specified path by:
        - Normalizing accented characters to their ASCII equivalents (e.g., é → e, ñ → n)
        - Converting filenames to lowercase
        - Replacing all non-alphanumeric characters (except underscores) with underscores
        - Preserving file extensions
        This ensures filenames are ASCII-safe and follow a consistent naming convention.

    .PARAMETER Path
        The directory path to search for files. Defaults to the current directory.

    .PARAMETER Filter
        File extension filter(s) to limit which files are renamed.
        Can be a single extension (e.g., "*.txt") or an array (e.g., "*.txt", "*.csv").
        If not specified, all files will be processed.

    .PARAMETER DryRun
        When specified, shows what files would be renamed without actually renaming them.
        Useful for previewing changes before executing.

    .EXAMPLE
        Rename-FilesToStandard -DryRun
        Preview what files in the current directory would be renamed.

    .EXAMPLE
        Rename-FilesToStandard -Path "C:\Data" -DryRun
        Preview what files in C:\Data would be renamed.

    .EXAMPLE
        Rename-FilesToStandard -Filter "*.txt" -DryRun
        Preview what text files would be renamed.

    .EXAMPLE
        Rename-FilesToStandard -Filter "*.txt", "*.csv" -DryRun
        Preview what text and CSV files would be renamed.

    .EXAMPLE
        Rename-FilesToStandard
        Rename all files in the current directory.

    .EXAMPLE
        Rename-FilesToStandard -Path "C:\Data"
        Rename all files in C:\Data and its subdirectories.
    #>
    param(
        [string]$Path = ".",
        [string[]]$Filter,
        [switch]$DryRun
    )

    $files = if ($Filter) {
        Get-ChildItem -Path $Path -Recurse -File -Include $Filter
    } else {
        Get-ChildItem -Path $Path -Recurse -File
    }

    $files | ForEach-Object {
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        $extension = $_.Extension

        # Normalize accented characters to ASCII equivalents
        $normalizedBaseName = $baseName.Normalize([Text.NormalizationForm]::FormD)
        $asciiBaseName = $normalizedBaseName -replace '\p{M}', ''

        # Replace non-alphanumeric characters and convert to lowercase
        $newBaseName = ($asciiBaseName -replace '[^a-zA-Z0-9_]', '_').ToLower()
        $newName = $newBaseName + $extension.ToLower()

        if ($_.Name -ne $newName) {
            $newPath = Join-Path -Path $_.DirectoryName -ChildPath $newName
            Write-Host "Renaming '$($_.FullName)' to '$newPath'"

            if (-not $DryRun) {
                Rename-Item -Path $_.FullName -NewName $newPath
            }
        }
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
# Help
# ---------------------------------------------------------------------------

function Get-KompanionHelperFunctions() {
    <#
    .SYNOPSIS
        Lists all functions available in the helpers.ps1 module and utils directory.

    .DESCRIPTION
        Retrieves and displays all functions defined in helpers.ps1 and all scripts
        in the utils directory. By default, shows only function names grouped by source file.

    .PARAMETER Detailed
        When specified, shows detailed help information for each function.

    .EXAMPLE
        Get-KompanionHelperFunctions
        Lists all available function names grouped by source file.

    .EXAMPLE
        Get-KompanionHelperFunctions -Detailed
        Shows detailed help information for each function.
    #>
    param(
        [switch]$Detailed
    )

    # Collect all script files
    $scriptFiles = @(
        @{
            Path = "$env:KOMPANION_SRC\helpers.ps1"
            Name = "helpers.ps1"
        }
    )

    # Add all utils scripts
    Get-ChildItem -Path "$env:KOMPANION_SRC\utils" -Filter "*.ps1" | ForEach-Object {
        $scriptFiles += @{
            Path = $_.FullName
            Name = "utils/$($_.Name)"
        }
    }

    Write-Host "`nAvailable Functions in Kompanion:" -ForegroundColor Cyan
    Write-Host ("=" * 80) -ForegroundColor Cyan

    $totalFunctions = 0

    foreach ($script in $scriptFiles) {
        # Parse the script to find all function definitions
        $functions = Get-Content -Path $script.Path |
            Select-String -Pattern "^function\s+(\S+)" |
            ForEach-Object {
                $_.Matches.Groups[1].Value
            }

        if ($functions.Count -gt 0) {
            Write-Host "`n[$($script.Name)]" -ForegroundColor Yellow
            Write-Host ("-" * 80) -ForegroundColor DarkGray

            if ($Detailed) {
                foreach ($func in $functions) {
                    $help = Get-Help $func -ErrorAction SilentlyContinue
                    if ($help) {
                        Write-Host "`n  $func" -ForegroundColor Green
                        Write-Host ("    " + $help.Synopsis) -ForegroundColor White
                        if ($help.Description) {
                            Write-Host "    Description: $($help.Description.Text)" -ForegroundColor Gray
                        }
                    } else {
                        Write-Host "`n  $func" -ForegroundColor Green
                        Write-Host "    (No help available)" -ForegroundColor DarkGray
                    }
                }
            } else {
                foreach ($func in $functions) {
                    Write-Host "  $func" -ForegroundColor White
                }
            }

            $totalFunctions += $functions.Count
        }
    }

    Write-Host "`n" -NoNewline
    Write-Host ("=" * 80) -ForegroundColor Cyan
    Write-Host "Total Functions: $totalFunctions" -ForegroundColor Cyan
    Write-Host ("=" * 80) -ForegroundColor Cyan
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------