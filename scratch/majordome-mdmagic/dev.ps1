<#
.SYNOPSIS
    Development helper for the Majordome JupyterLab extension.

.DESCRIPTION
    Automates common local workflows for the frontend-only extension:
    install npm deps, build, link/unlink into JupyterLab, and status checks.
#>

param(
    [switch]$Setup,
    [switch]$Build,
    [switch]$Link,
    [switch]$Unlink,
    [switch]$Status,
    [switch]$Watch,
    [switch]$LaunchLab
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Assert-Tool {
    param([string]$Name)

    $tool = Get-Command $Name -ErrorAction SilentlyContinue
    if (-not $tool) {
        throw "Required tool '$Name' was not found in PATH."
    }
}

function Invoke-Step {
    param(
        [string]$Title,
        [scriptblock]$Action
    )

    Write-Host ""
    Write-Host "==> $Title" -ForegroundColor Cyan
    & $Action
}

function Invoke-NpmInstallIfNeeded {
    if (-not (Test-Path (Join-Path $PSScriptRoot "node_modules"))) {
        Invoke-Step "npm install" {
            npm install
        }
        return
    }

    Write-Host "node_modules found, skipping npm install"
}

function Invoke-NpmBuild {
    Invoke-Step "npm run build" {
        npm run build
    }
}

Assert-Tool -Name "npm"
Assert-Tool -Name "jupyter"

if (-not ($Setup -or $Build -or $Link -or $Unlink -or $Status -or $Watch -or $LaunchLab)) {
    Write-Host "No action selected. Running default flow: Setup + Build + Link + Status"
    $Setup = $true
    $Build = $true
    $Link = $true
    $Status = $true
}

Push-Location $PSScriptRoot
try {
    if ($Setup) {
        Invoke-Step "setup dependencies" {
            Invoke-NpmInstallIfNeeded
        }
    }

    if ($Build) {
        Invoke-NpmBuild
    }

    if ($Link) {
        Invoke-Step "jupyter labextension link" {
            jupyter labextension link .
        }
    }

    if ($Unlink) {
        Invoke-Step "jupyter labextension unlink" {
            jupyter labextension unlink .
        }
    }

    if ($Status) {
        Invoke-Step "jupyter labextension list" {
            jupyter labextension list
        }
    }

    if ($Watch) {
        Invoke-Step "npm run watch" {
            npm run watch
        }
    }

    if ($LaunchLab) {
        Invoke-Step "jupyter lab" {
            jupyter lab
        }
    }
}
finally {
    Pop-Location
}
