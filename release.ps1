param (
    [Parameter(Mandatory=$true)]
    [string]$Version,
    [switch]$Force
)

$script:WslName = "Ubuntu"
$script:VenvPath = ".venv"

function Get-TomlSectionVersion {
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Path,
        [Parameter(Mandatory=$true, Position=1)][string]$Section
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

function Update-PackageVersion {
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Version
    )

    # Try to match a version number like "1.2.3":
    $isNumb = $version -match "^\d+\.\d+\.\d+$"

    # Try to match a bump type like "patch", "minor", or "major":
    $isBump = $version -in ("patch", "minor", "major")

    # If the version input is neither a valid version number nor a valid
    # bump type, exit with an error.
    if (-not ($isNumb -or $isBump)) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Invalid version input." `
        "`n> Please specify a valid version or a bump type." `
        "`n> Examples: '1.2.3', 'patch', 'minor', 'major'."
        exit 1
    }

    # Get the current version from the latest git tag:
    $currentTag = (git describe --tags --abbrev=0)

    # Remove leading "v" if present:
    if ($currentTag.StartsWith("v")) {
        $currentTag = $currentTag.Substring(1)
    }

    Write-Host -ForegroundColor Green `
    "`n> Current version ...: $currentTag" `
    "`n> Target version ....: $version"

    # Update the version according to the input:
    if ($isBump) {
        uv version --bump $version
        cargo set-version --bump $version
    } else {
        uv version $version
        cargo set-version $version
    }

    return $currentTag
}

function Approve-ReleaseVersion {
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Version
    )

    $currentTag       = Update-PackageVersion $Version
    $cargoVersion     = Get-TomlSectionVersion "Cargo.toml"      "package"
    $pyprojectVersion = Get-TomlSectionVersion "pyproject.toml"  "project"

    if ($cargoVersion -ne $pyprojectVersion) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Version mismatch between Cargo.toml and pyproject.toml." `
        "`n> Cargo.toml .......: $cargoVersion" `
        "`n> pyproject.toml ...: $pyprojectVersion"
        exit 1
    }

    if ($cargoVersion -eq $currentTag) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Version did not change from current tag." `
        "`n> Current tag .......: $currentTag" `
        "`n> New version .......: $cargoVersion"

        Write-Host -ForegroundColor Red `
        "`n> Please update the version before releasing."
        exit 1

    }

    $hasTag = git rev-parse -q --verify "refs/tags/v$cargoVersion"

    if ($hasTag) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Tag v$cargoVersion already exists." `
        "`n> Please update the version before releasing."
        exit 1
    }

    return $cargoVersion
}

function Start-ReleaseBuild {
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Version,
        [Parameter(Mandatory=$true, Position=1)][switch]$CommitChanges
    )

    $newVersion = Approve-ReleaseVersion $Version

    if ($CommitChanges) {
        git add "Cargo.toml" "pyproject.toml" "Cargo.lock" "uv.lock"
        git commit -m "Release version $newVersion"
        git tag "v$newVersion"
        git push origin main --tags

        Write-Host -ForegroundColor Green `
        "`n> Committed and tagged version $newVersion."
    }

    Write-Host -ForegroundColor Green "`n> Cleaning dist directory..."
    Remove-Item -Path "dist/*" -Force -Recurse -ErrorAction SilentlyContinue

    Write-Host -ForegroundColor Green "`n> Building Windows executable..."
    uv build --wheel

    if ($LASTEXITCODE -ne 0) { throw "`n> Error: Windows build failed." }

    Write-Host -ForegroundColor Green "`n> Building Linux executable..."
    $wslPath = (wsl wslpath $PsScriptRoot.Replace("\", "/"))
    $command = "cd $wslPath && source ~/.bashrc && ./release.sh"
    wsl -d $script:WslName -- bash -c $command

    if ($LASTEXITCODE -ne 0) { throw "`n> Error: Linux build failed." }

    return $newVersion
}

function Start-DocumentationBuild {
    Write-Host -ForegroundColor Green `
    "`n> Building documentation..."

    $pythonPath = "$script:VenvPath\Scripts\python.exe"

    if (-not (Test-Path $script:VenvPath)) {
        uv venv $script:VenvPath
    }

    & "$script:VenvPath\Scripts\Activate.ps1"
    uv pip install '.[docs]'

    $env:QUARTO_PYTHON = $pythonPath
    quarto render "docs" --to html

    if ($LASTEXITCODE -ne 0) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Documentation build failed."
        exit 1
    }

    Write-Host -ForegroundColor Green `
    "`n> Documentation built successfully."

    quarto publish gh-pages --no-prompt --no-browser docs
}

function Start-Workflow {
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Version,
        [Parameter(Mandatory=$true, Position=1)][bool]$Force
    )

    Write-Host -ForegroundColor Green `
    "`n> Preliminary validation..."

    # Flag to indicate whether to skip committing changes:
    $commitChanges = $true

    # Check for modified files (status code M) in git:
    $hasModified = git status --porcelain | Select-String -Pattern '^\s*M\s' -Quiet

    # If there are modified files and --force is not set, exit with an error.
    # Otherwise, continue but set a flag to skip committing changes.
    if ($hasModified -and -not $Force) {
        Write-Host -ForegroundColor Red `
        "`n> Error: Uncommitted changes detected." `
        "`n> Please commit or stash them before releasing."
        exit 1
    } elseif ($hasModified -and $Force) {
        Write-Host -ForegroundColor Yellow `
        "`n> Warning: uncommitted changes but proceeding due to --force."
        $commitChanges = $false
    }

    $newVersion = Start-ReleaseBuild $Version $commitChanges
    Start-DocumentationBuild

    Write-Host -ForegroundColor Green `
    "`n> Publishing GitHub release..."

    $wheels = Get-ChildItem "dist/*.whl" | ForEach-Object { $_.FullName }
    gh release create "v$newVersion" $wheels --generate-notes
}

Start-Workflow $Version $Force
