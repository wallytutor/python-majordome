# build.ps1

param (
    # -- Build options

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FlagRelease,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FlagBacktrace,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$RustCheck,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$RustCore,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$TestRust,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$TestPython,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [switch]$FromPip,

    [Parameter(Mandatory=$false, ParameterSetName="Build")]
    [ValidateScript({
        if (-not $FromPip) { throw "-PackageDist requires -FromPip." }
        $true
    })]
    [switch]$PackageDist,

    # -- Documentation options

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [switch]$PackageDocs,

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [ValidateScript({
        if (-not $PackageDocs) { throw "-FreshDocs requires -PackageDocs." }
        $true
    })]
    [switch]$FreshDocs,

    [Parameter(Mandatory=$false, ParameterSetName="Docs")]
    [ValidateScript({
        if (-not $PackageDocs) { throw "-DocsPdf requires -PackageDocs." }
        $true
    })]
    [switch]$DocsPdf,

    # Separate set: publish only if it works!
    [Parameter(Mandatory=$false, ParameterSetName="PublishDocs")]
    [switch]$PublishDocs,

    # -- Clean options

    [Parameter(Mandatory=$false, ParameterSetName="Clean")]
    [switch]$Clean,

    [Parameter(Mandatory=$false, ParameterSetName="Clean")]
    [switch]$DistClean,

    # -- Help

    [Parameter(Mandatory=$false, ParameterSetName="Help")]
    [switch]$Help,

    # Just so that it runs...
    [Parameter(Mandatory=$false, ParameterSetName="Dummy")]
    [switch]$Dummy,

    [Parameter(Mandatory=$false)]
    [string]$PythonEnv = ""
)

$script:PYTHON_ENV = $null
$script:PATH_CORE   = "$PSScriptRoot\bindings\rust\Cargo.toml"

$env:MAJORDOME_INSTALL = "$PSScriptRoot[full]"
$env:QUARTO_PYTHON = ""

function Remove-Hard {
    param (
        [string]$path
    )
    Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
}

function Test-ToolStatus {
    param (
        [string]$ToolName,
        [string]$Result
    )
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$ToolName found: $Result"
    } else {
        Write-Host "$ToolName not found! Please install $ToolName..."
        exit 1
    }
}

function Assert-CleanGitForPackageDist {
    $statusOutput = git status --porcelain 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Could not determine git status. Aborting -PackageDist for safety."
        exit 1
    }

    if ([string]::IsNullOrWhiteSpace(($statusOutput -join ""))) {
        return
    }

    Write-Warning "-PackageDist requires a clean git repository."
    Write-Warning "Uncommitted changes were detected; aborting to prevent accidental tagging."
    exit 1
}

function Initialize-PythonEnvironment {
    param (
        [pscustomobject]$PyEnv
    )

    if (Test-Path $PyEnv.VenvPath) {
        Write-Host "Virtual environment already exists: $($PyEnv.VenvPath)"
        return $false
    }

    # --seed ensures pip/setuptools/wheel are available in new uv venvs.
    & uv venv --seed --python $PyEnv.Version $PyEnv.VenvPath

    $PythonExe = $PyEnv.PythonExe
    $Label = $PyEnv.Name

    $pipVersion = & $PythonExe -m pip --version 2>$null
    Test-ToolStatus -ToolName "[$Label] pip" -Result $pipVersion

    Write-Host "[$Label] Upgrading packaging tools..."
    & $PythonExe -m pip install --upgrade pip
    & $PythonExe -m pip install --upgrade --force-reinstall build wheel
    & $PythonExe -m pip install --upgrade --force-reinstall setuptools
    & $PythonExe -m pip install --upgrade --force-reinstall setuptools_rust

    Write-Host "[$Label] Installing project in editable mode..."
    & $PythonExe -m pip install -e "$env:MAJORDOME_INSTALL"

    return $true
}

function Invoke-VenvActivation {
    $cargoVersion = cargo --version 2>$null
    Test-ToolStatus -ToolName "Cargo" -Result $cargoVersion

    $quartoVersion = quarto --version 2>$null
    Test-ToolStatus -ToolName "Quarto" -Result $quartoVersion

    $uvVersion = uv --version 2>$null
    Test-ToolStatus -ToolName "uv" -Result $uvVersion

    switch ($PythonEnv) {
        "py312" {
            $script:PYTHON_ENV = [PSCustomObject]@{
                Name = "py312";
                Version = "3.12";
                VenvPath = "$PSScriptRoot\venv312"
            }
        }
        "py313" {
            $script:PYTHON_ENV = [PSCustomObject]@{
                Name = "py313";
                Version = "3.13";
                VenvPath = "$PSScriptRoot\venv313"
            }
        }
        "py314" {
            $script:PYTHON_ENV = [PSCustomObject]@{
                Name = "py314";
                Version = "3.14";
                VenvPath = "$PSScriptRoot\venv314"
            }
        }
        default {
            Write-Host "Invalid Python environment selection: $PythonEnv"
            Write-Host "Use: -PythonEnv py312 | py313 | py314"
            exit 1
        }
    }

    $name = "PythonExe"
    $value = Join-Path $script:PYTHON_ENV.VenvPath "Scripts\python.exe"
    $script:PYTHON_ENV | Add-Member -NotePropertyName $name -NotePropertyValue $value

    $hasNewVenv = Initialize-PythonEnvironment -PyEnv $script:PYTHON_ENV

    $env:QUARTO_PYTHON = $script:PYTHON_ENV.PythonExe

    Write-Host "QUARTO_PYTHON set to: $env:QUARTO_PYTHON"

    $activateScript = Join-Path $script:PYTHON_ENV.VenvPath "Scripts\Activate.ps1"
    if (-not (Test-Path $activateScript)) {
        Write-Host "Could not find activation script: $activateScript"
        exit 1
    }

    # Dot-source activation so the selected venv remains active for subsequent commands.
    . $activateScript
    Write-Host "Activated Python environment: $($script:PYTHON_ENV.Name)"

    if ($hasNewVenv) {
        & quarto install tinytex
        & quarto check
    }

    & $env:QUARTO_PYTHON -c "import setuptools, inspect; print(setuptools.__file__)"
}

function Install-PythonPackage {
    # XXX: the following is fragile, it injects the legacy setup.py
    # build_ext --inplace option in a PEP 517 compliant build. It was
    # the only way I found to get the .pyd files generated in the source
    # directory, for accelerating the development cycle.
    # "--config-settings=--build-option=--inplace"

    # XXX: using the following it stopped generating the .pyd files
    # for some reason, even though it was working before. Maybe deps?
    # UPDATE: the project venv was missing setuptools-rust (which was
    # being used from elswhere), reasong why it was not working!
    $opts = @("--no-deps", "--no-build-isolation")

    if ($FlagRelease) { $opts += "--config-settings=rust.debug=false" }

    $pyEnv = $script:PYTHON_ENV
    Write-Host "[$($pyEnv.Name)] Installing editable package"

    if ($PackageDist) {
        Assert-CleanGitForPackageDist
        & $pyEnv.PythonExe version.py -tag
    }

    & $pyEnv.PythonExe -m pip install -e $env:MAJORDOME_INSTALL @opts
    & majordome --install-kernel

    if ($PackageDist) {
        & $pyEnv.PythonExe -m build --wheel

        $distPath = Join-Path $PSScriptRoot "dist"
        $latestWheel = Get-ChildItem -Path $distPath -Filter "*.whl" |
                       Sort-Object LastWriteTime -Descending |
                       Select-Object -First 1

        if ($latestWheel) {
            Write-Host "`n[$($pyEnv.Name)] Latest wheel: $($latestWheel.Name)"

            Write-Host "`nData files in wheel:"
            & $pyEnv.PythonExe -m zipfile -l $latestWheel.FullName | Select-String "data"

            Write-Host "`nRust extension modules (.pyd) in wheel:"
            & $pyEnv.PythonExe -m zipfile -l $latestWheel.FullName | Select-String "pyd"
        } else {
            Write-Host "No wheel file found in dist/"
        }
    }

    exit 0
}

function Main {
    if ($Help) {
        Get-Help $PSCommandPath
        exit 0
    }

    if ($Clean -or $DistClean) {
        Write-Warning "Cleaning previous builds..."
        Remove-Hard $(Join-Path $PSScriptRoot "build")
        Remove-Hard $(Join-Path $PSScriptRoot "target")
        Remove-Hard $(Join-Path $PSScriptRoot "log.*")
        Remove-Hard $(Join-Path $PSScriptRoot "__pycache__")
        Remove-Hard $(Join-Path $PSScriptRoot "*.egg-info")
        Remove-Hard $(Join-Path $PSScriptRoot ".quarto")
        Remove-Hard $(Join-Path $PSScriptRoot ".vscode")
        Remove-Hard $(Join-Path $PSScriptRoot "_book")

        if ($DistClean) {
            Write-Warning "Cleaning distribution and environment..."
            Remove-Hard $(Join-Path $PSScriptRoot "venv312")
            Remove-Hard $(Join-Path $PSScriptRoot "venv313")
            Remove-Hard $(Join-Path $PSScriptRoot "venv314")
            Remove-Hard $(Join-Path $PSScriptRoot "dist")
        }

        exit 0
    }

    & { # Set-EnvironmentVariables
        $env:RUSTFLAGS = "-A warnings"
        $env:RUST_BACKTRACE = 0
        $env:SETUPTOOLS_RUST_CARGO_PROFILE = "dev"
        $env:CARGO_INCREMENTAL = 1

        if ($FlagRelease) {
            $env:RUSTFLAGS += " -C opt-level=3"
            $env:SETUPTOOLS_RUST_CARGO_PROFILE = "release"
        }

        if ($FlagBacktrace) {
            $env:RUST_BACKTRACE = 1
        }

        Write-Host ""
        Write-Host "Environment variables set:"
        Write-Host "RUSTFLAGS ....................: $env:RUSTFLAGS"
        Write-Host "RUST_BACKTRACE ...............: $env:RUST_BACKTRACE"
        Write-Host "SETUPTOOLS_RUST_CARGO_PROFILE : $env:SETUPTOOLS_RUST_CARGO_PROFILE"
        Write-Host "CARGO_INCREMENTAL ............: $env:CARGO_INCREMENTAL"
        Write-Host ""
    }

    $needsPythonEnv = (
        $FromPip `
        -or $TestPython `
        -or $PackageDocs `
        -or $PublishDocs `
        -or $Dummy
    )

    if ($needsPythonEnv -and [string]::IsNullOrWhiteSpace($PythonEnv)) {
        Write-Host "Python environment is required for this operation."
        Write-Host "Use: -PythonEnv py312 | py313 | py314"
        exit 1
    }

    if ($needsPythonEnv) {
        Invoke-VenvActivation
    }

    if ($FromPip) {
        Install-PythonPackage
    }
    if ($RustCore) {
        $opts = @()
        if ($FlagRelease) { $opts += "--release" }
        cargo build @opts --manifest-path $PATH_CORE
        exit 0
    }
    if ($RustCheck) {
        cargo check --manifest-path $PATH_CORE
        exit 0
    }
    if ($TestRust) {
        cargo test --manifest-path $PATH_CORE
        exit 0
    }
    if ($TestPython) {
        & $script:PYTHON_ENV.PythonExe -m pytest -v
        exit 0
    }
    if ($PackageDocs) {
        $opts = @()

        if ($FreshDocs) {
            $opts = $opts + "--no-cache"
            Remove-Hard $(Join-Path $PSScriptRoot "_book")
            Remove-Hard $(Join-Path $PSScriptRoot "_site")
        }

        & quarto render --to html @opts

        if ($DocsPdf) {
            & quarto render --to pdf @opts
        }

        exit 0
    }
    if ($PublishDocs) {
        & quarto publish gh-pages --no-prompt --no-browser
        exit 0
    }

    Write-Host "No build option specified."
}

Main
