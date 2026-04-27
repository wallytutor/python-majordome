param (
    [string]$version = "patch",
    [bool]$dryRun = $true
)

#region: tools
function Get-TomlSectionVersion {
    param (
        [string]$Path,
        [string]$Section
    )

    $inSection = $false

    foreach ($line in Get-Content $Path) {
        if ($line -match '^\[(.+)\]\s*$') {
            $inSection = $Matches[1] -eq $Section
            continue
        }

        if ($inSection -and $line -match '^version\s*=\s*"([^"]+)"') {
            return $Matches[1]
        }
    }

    Write-Host -ForegroundColor Red `
    "Error: Could not find version in [$Section] of $Path."

    exit 1
}
#endregion: tools

#region: check-for-uncommitted-changes
git status --porcelain | ForEach-Object {
    if ($_ -match "^\s*M\s") {
        Write-Host -ForegroundColor Red `
        "Error: Uncommitted changes detected." `
        "Please commit or stash them before releasing."
        exit 1
    }
}
#endregion: check-for-uncommitted-changes

#region: validate-version-input
$isNumb = $version -match "^\d+\.\d+\.\d+$"
$isBump = $version -in ("patch", "minor", "major")

if (-not ($isNumb -or $isBump)) {
    Write-Host -ForegroundColor Red `
    "Error: Invalid version input." `
    "Please specify a valid version (e.g., 1.0.3) " `
    "or a bump type (patch, minor, major)."
    exit 1
}
#endregion: validate-version-input

#region: get-current-version
$currentTag = (git describe --tags --abbrev=0)

if ($currentTag.StartsWith("v")) {
    $currentTag = $currentTag.Substring(1)
}

if ($isBump) {
    uv version --bump $version
    cargo set-version --bump $version
} else {
    uv version $version
    cargo set-version $version
}
#endregion: get-current-version

#region: get-new-version
$cargoVersion     = Get-TomlSectionVersion -Path "Cargo.toml"     -Section "package"
$pyprojectVersion = Get-TomlSectionVersion -Path "pyproject.toml" -Section "project"

if ($cargoVersion -ne $pyprojectVersion) {
    Write-Host -ForegroundColor Red `
    "Error: Version mismatch between Cargo.toml and pyproject.toml." `
    "Cargo.toml .......: $cargoVersion" `
    "pyproject.toml ...: $pyprojectVersion"
    exit 1
}

if ($cargoVersion -eq $currentTag) {
    Write-Host -ForegroundColor Red `
    "Error: Version did not change from current tag." `
    "Current tag .......: $currentTag" `
    "New version ......: $cargoVersion"
    exit 1
}

$newVersion = $cargoVersion
#endregion: get-new-version