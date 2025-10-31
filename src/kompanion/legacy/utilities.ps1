# -*- powershell -*-

function Convert-ToBackSlash {
    param([string]$Path)
    return $Path -replace '/', '\'
}

function Get-KompanionPath() {
    param ( [string]$ChildPath )
    $path = Join-Path -Path $env:KOMPANION -ChildPath $ChildPath
    return Convert-ToBackSlash $path
}

function Get-PackagePath() {
    param( [pscustomobject]$obj )
    return Get-KompanionPath "$($obj.path)\$($obj.name)"
}

function Test-InPath() {
    param( [string]$Directory )

    $normalized = $Directory.TrimEnd('\')
    $filtered = ($env:Path -split ';' | ForEach-Object { $_.TrimEnd('\') })

    return $filtered -contains $normalized
}

function Print-Path() {
    return $env:Path -split ';'
}

function Add-ToPath() {
    param ( [string]$Directory )

    if (Test-Path -Path $Directory) {
        if (Test-InPath $Directory) {
            Write-Host "Skipping already sourced: $Directory"
        } else {
            $env:Path = "$(Convert-ToBackSlash $Directory);" + $env:Path
            Write-Host "Prepending to path: $Directory"
        }
    } else {
        Write-Host "Not prepeding missing path to environment: $Directory"
    }
}

function Enable-Module() {
    Write-Host "Sorry, WIP..."
}

function Show-ModuleList() {
    Write-Host "Sorry, WIP..."
}

function Piperish() {
    $pythonPath = "$env:PYTHON_HOME\python\python.exe"

    if (Test-Path -Path $pythonPath) {
        $argList = @("-m", "pip", "--trusted-host", "pypi.org",
                     "--trusted-host", "files.pythonhosted.org") + $args
        Invoke-CapturedCommand $pythonPath $argList
    } else {
        Write-Host "Python executable not found!"
    }
}

function Get-KompanionConfig() {
    $raw = Get-Content -Path "$env:KOMPANION_DATA\kompanion.json" -Raw
    return $raw | ConvertFrom-Json
}

function Start-Kompanion() {
    Code.exe `
        --extensions-dir $env:VSCODE_EXTENSIONS `
        --user-data-dir  $env:VSCODE_SETTINGS  .
}

# -*- powershell -*-

function Invoke-CapturedCommand() {
    param( [string]$FilePath, [string[]]$ArgumentList )
    Start-Process -FilePath $FilePath -ArgumentList $ArgumentList `
        -NoNewWindow -Wait -RedirectStandardOutput "temp/log.out" `
        -RedirectStandardError "temp/log.err"

    Get-Content "temp/log.out" | Add-Content $KOMPANION_LOG
    Get-Content "temp/log.err" | Add-Content $KOMPANION_ERR
}

function Invoke-DownloadIfNeeded() {
    param ( [string]$URL, [string]$Output )

    if (Test-Path -Path $Output) {
        Write-Host "Skipping download of $URL..."
    } else {
        Write-Host "Downloading $URL as $Output"
        Start-BitsTransfer -Source $URL -Destination $Output
    }
}

function Invoke-UncompressIfNeeded() {
    param ( [string]$Source, [string]$Destination, [string]$Method = "ZIP" )

    if (Test-Path -Path $Destination) {
        Write-Host "Skipping extraction of $Source..."
    } else {
        Write-Host "Expanding $Source into $Destination"
        if ($Method -eq "ZIP") {
            Expand-Archive -Path $Source -DestinationPath $Destination
        }
        elseif ($Method -eq "7Z") {
            Invoke-CapturedCommand "7zr.exe" @("x", $Source , "-o$Destination")
        }
        elseif ($Method -eq "TAR") {
            New-Item -Path "$Destination" -ItemType Directory
            tar -xzf $Source -C $Destination
        }
        elseif ($Method -eq "MSI") {
            Write-Host "Installing MSI package $Source ... $Destination"
            Invoke-CapturedCommand "lessmsi.exe" @("x", $Source , "$Destination\")
        }
        else {
            Write-Host "Unknown expansion method $Method..."
        }
    }
}

function Invoke-InstallIfNeeded() {
    param( [pscustomobject]$Config, [string]$Method = "ZIP" )
    $output = Get-KompanionPath $Config.saveAs
    $path   = Get-KompanionPath $Config.path
    Invoke-DownloadIfNeeded -URL $Config.URL -Output $output
    Invoke-UncompressIfNeeded -Source $output -Destination $path -Method $Method
    return $path
}

# -*- powershell -*-

function Start-KompanionSetup() {
    Write-Host "Starting Kompanion setup!"
    $config = Get-KompanionConfig


    $path = $env:KOMPANION_BIN
    if (!(Test-Path $path)) { New-Item -ItemType Directory -Path $path }

    $path = $env:KOMPANION_TEMP
    if (!(Test-Path $path)) { New-Item -ItemType Directory -Path $path }


    # -----------------------------------------------------------------------
    # VSCODE
    # -----------------------------------------------------------------------

    & {
        $trash = Invoke-InstallIfNeeded $config.install.vscode
        Initialize-VSCode $config.install.vscode

        # TODO failing because of certificate
        # foreach ($pkg in $Config.requirements) {
        #     $cmdPath = "$env:VSCODE_HOME\bin\Code.cmd"
        #     $argList = @("--extensions-dir", $env:VSCODE_EXTENSIONS,
        #                  "--user-data-dir",   $env:VSCODE_SETTINGS,
        #                  "--install-extension", $pkg)
        #     Invoke-CapturedCommand $cmdPath $argList
        # }
    }

    # -----------------------------------------------------------------------
    # 7-zip
    # -----------------------------------------------------------------------

    & {
        $output  = Get-KompanionPath $config.install.sevenzip.saveAs
        $path    = Get-KompanionPath $config.install.sevenzip.path
        Invoke-DownloadIfNeeded -URL $config.install.sevenzip.URL -Output $output

        if (Test-Path -Path $path) {
            Write-Host "Skipping extraction of $output..."
        } else {
            Write-Host "Expanding $output into $path"
            Copy-Item -Path $output -Destination $path
        }
    }

    # -----------------------------------------------------------------------
    # Git
    # -----------------------------------------------------------------------

    & {
        $output  = Get-KompanionPath $config.install.git.saveAs
        $path    = Get-KompanionPath $config.install.git.path
        Invoke-DownloadIfNeeded -URL $config.install.git.URL -Output $output

        if (Test-Path -Path $path) {
            Write-Host "Skipping extraction of $output..."
        } else {
            Write-Host "Expanding $output into $path"
            Invoke-CapturedCommand $output @("-y", "-o$path")
        }

        Initialize-Git $config.install.git
    }

    # -----------------------------------------------------------------------
    # MSYS2
    # -----------------------------------------------------------------------

    & {
        # $output = Get-KompanionPath $$config.install.msys2.saveAs
        # $path   = Get-KompanionPath $$config.install.msys2.path
        # Invoke-DownloadIfNeeded -URL $$config.install.msys2.URL -Output $output

        # if (Test-Path -Path $path) {
        #     Write-Host "Skipping extraction of $output..."
        # } else {
        #     Write-Host "Expanding $output into $path"
        #     $argList = @("in", "--confirm-command", "--accept-messages"
        #                  "--root", "$path")
        #     Invoke-CapturedCommand $output $argList
        # }

        # $bash = Get-KompanionPath "bin\msys2\usr\bin\bash"
        # $argList = @("-lc", "'pacman -Syu --noconfirm'")
        # $argList = @("-lc", "'pacman -Su --noconfirm'")
        # bin\msys2\usr\bin\bash -lc "pacman -Syu --noconfirm"
        # bin\msys2\usr\bin\bash -lc "pacman -Su --noconfirm"
        # pacman-key --init && pacman-key --populate msys2
        # pacman -Syuu && pacman -S bash coreutils make gcc p7zip
        # pacman -Sy --noconfirm; pacman -S --noconfirm p7zip
    }

    # -----------------------------------------------------------------------
    # LESSMSI
    # -----------------------------------------------------------------------

    $trash = Invoke-InstallIfNeeded $config.install.lessmsi
    Initialize-Lessmsi $config.install.lessmsi

    # -----------------------------------------------------------------------
    # NEOVIM
    # -----------------------------------------------------------------------

    $trash = Invoke-InstallIfNeeded $config.install.neovim
    Initialize-Neovim $config.install.neovim

    # -----------------------------------------------------------------------
    # MODULES
    # -----------------------------------------------------------------------

    if ($EnableLaTeX) {
        $trash = Invoke-InstallIfNeeded $config.install.pandoc
        Initialize-Pandoc $config.install.pandoc

        $trash = Invoke-InstallIfNeeded $config.install.jabref
        Initialize-JabRef $config.install.jabref

        $trash = Invoke-InstallIfNeeded $config.install.inkscape -Method "7Z"
        Initialize-Inkscape $config.install.inkscape

        $path = Invoke-InstallIfNeeded $config.install.miktexsetup
        $path = "$path\miktexsetup_standalone.exe"

        $pkgData = Get-KompanionPath $config.install.miktexsetup.data
        $miktex  = Get-PackagePath $config.install.miktex

        if (Test-Path -Path $pkgData) {
            Write-Host "Skipping download of package data to $pkgData..."
        } else {
            Write-Host "Downloading MikTex data to $pkgData"
            # XXX: finally it works without this:
            #  "--remote-package-repository", $Config.repo,
            $argList = @("download", "--package-set", "basic",
                        "--local-package-repository", $pkgData)
            Invoke-CapturedCommand $path $argList
        }

        if (Test-Path -Path $miktex) {
            Write-Host "Skipping install of MikTex to $miktex..."
        } else {
            Write-Host "Installing MikTex data to $miktex"
            $argList = @("install", "--package-set", "basic",
                        "--local-package-repository", $pkgData,
                        "--portable", $miktex)
            Invoke-CapturedCommand $path $argList
        }

        Initialize-MikTeX $config.install.miktex
    }

    if ($EnableElmer) {
        $trash = Invoke-InstallIfNeeded $config.install.elmer
        Initialize-Elmer $config.install.elmer
    }

    if ($EnableGmsh) {
        $trash = Invoke-InstallIfNeeded $config.install.gmsh
        Initialize-Gmsh $config.install.gmsh
    }

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    if ($EnablePython) {
        $pyConfig = $config.install.python
        $trash = Invoke-InstallIfNeeded $pyConfig
        Initialize-Python $pyConfig

        $requirements = Get-KompanionPath $pyConfig.requirements
        Piperish "install" "-r" $requirements
    }

    if ($EnableJulia)  {
        $jlConfig = $config.install.julia
        $trash = Invoke-InstallIfNeeded $jlConfig
        Initialize-Julia $jlConfig

        Invoke-CapturedCommand "$env:JULIA_HOME\bin\julia.exe" @("-e", "exit()")
    }

    if ($EnableHaskell) {
        $hsConfig = $config.install.stack
        $trash = Invoke-InstallIfNeeded $hsConfig -Method "ZIP"
        Initialize-Haskell $hsConfig

        $stackPath = "$env:HASKELL_HOME\stack.exe"
        Invoke-CapturedCommand $stackPath @("setup")

        $content = Get-Content -Raw -Path "$env:KOMPANION_DATA\stack-config.yaml"
        $content = $content -replace '__STACK_ROOT__', $env:STACK_ROOT
        Set-Content -Path "$env:STACK_ROOT\config.yaml" -Value $content
    }

    if ($EnableRacket) {
        $rkConfig = $config.install.racket
        $trash = Invoke-InstallIfNeeded $rkConfig -Method "TAR"
        Initialize-Racket $rkConfig
    }

    if ($EnableMLton) {
        $mlConfig = $config.install.mlton
        $trash = Invoke-InstallIfNeeded $mlConfig -Method "TAR"
        Initialize-MLton $mlConfig
    }

    if ($EnableSMLNJ) {
        $smlConfig = $config.install.smlnj
        $trash = Invoke-InstallIfNeeded $smlConfig -Method "MSI"
        Initialize-SMLNJ $smlConfig
    }
}

# -*- powershell -*-

function Initialize-VSCode() {
    param( [pscustomobject]$obj )
    $env:VSCODE_HOME = Get-KompanionPath $obj.path
    Add-ToPath -Directory "$env:VSCODE_HOME"

    $env:VSCODE_EXTENSIONS = Convert-ToBackSlash "$env:KOMPANION_DATA\vscode\extensions"
    $env:VSCODE_SETTINGS   = Convert-ToBackSlash "$env:KOMPANION_DATA\vscode\user-data"
}

function Initialize-Git() {
    param( [pscustomobject]$obj )
    $env:GIT_HOME = Get-KompanionPath $obj.path
    Add-ToPath -Directory "$env:GIT_HOME\cmd"
}

function Initialize-Lessmsi() {
    param( [pscustomobject]$obj )
    $env:LESSMSI_HOME = Get-KompanionPath $obj.path
    Add-ToPath -Directory "$env:LESSMSI_HOME"
}

function Initialize-Neovim() {
    param( [pscustomobject]$obj )
    $env:NEOVIM_HOME = "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:NEOVIM_HOME\bin"
}

function Initialize-Python() {
    param( [pscustomobject]$obj )
    $env:PYTHON_HOME =  "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:PYTHON_HOME\python\Scripts"
    Add-ToPath -Directory "$env:PYTHON_HOME\python"

    # Jupyter to be used with IJulia (if any) and data path:
    $env:JUPYTER = "$env:PYTHON_HOME\python\Scripts\jupyter.exe"
    $env:JUPYTER_DATA_DIR = "$env:KOMPANION_DATA\jupyter"
}

function Initialize-Julia() {
    param( [pscustomobject]$obj )
    $env:JULIA_HOME = "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:JULIA_HOME\bin"

    $env:JULIA_DEPOT_PATH   = "$env:KOMPANION_DATA\julia"
    $env:JULIA_CONDAPKG_ENV = "$env:KOMPANION_DATA\CondaPkg"
}

function Initialize-Haskell() {
    param( [pscustomobject]$obj )
    $env:HASKELL_HOME = "$(Get-KompanionPath $obj.path)"
    Add-ToPath -Directory "$env:HASKELL_HOME"
}

function Initialize-Racket() {
    param( [pscustomobject]$obj )
    $env:RACKET_HOME = Get-PackagePath $obj
    Add-ToPath -Directory "$env:RACKET_HOME"
}

function Initialize-MLton() {
    param( [pscustomobject]$obj )
    $env:MLTON_HOME = Get-PackagePath $obj
    Add-ToPath -Directory "$env:MLTON_HOME\bin"
    Add-ToPath -Directory "$env:MLTON_HOME\lib\mlton"
}

function Initialize-SMLNJ() {
    param( [pscustomobject]$obj )
    $env:SMLNJ_HOME = "$(Get-KompanionPath $obj.path)\SourceDir\PFiles\SMLNJ"
    Add-ToPath -Directory "$env:SMLNJ_HOME\bin"
}

function Initialize-Pandoc() {
    param( [pscustomobject]$obj )
    $env:PANDOC_HOME = Get-PackagePath $obj
    Add-ToPath -Directory "$env:PANDOC_HOME"
}

function Initialize-JabRef() {
    param( [pscustomobject]$obj )
    $env:JABREF_HOME = Get-PackagePath $obj
    Add-ToPath -Directory "$env:JABREF_HOME"
}

function Initialize-Inkscape() {
    param( [pscustomobject]$obj )
    $env:INKSCAPE_HOME = "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:INKSCAPE_HOME\bin"
}

function Initialize-MikTeX() {
    param( [pscustomobject]$obj )
    $env:MIKTEX_HOME = Get-PackagePath $obj
    Add-ToPath -Directory "$env:MIKTEX_HOME"

    $path = "$env:MIKTEX_HOME\miktex-portable.cmd"
    Start-Process -FilePath $path -NoNewWindow

    Add-ToPath -Directory "$env:MIKTEX_HOME\texmfs\install\miktex\bin\x64\internal"
    Add-ToPath -Directory "$env:MIKTEX_HOME\texmfs\install\miktex\bin\x64"
}

function Initialize-Elmer() {
    param( [pscustomobject]$obj )
    $env:ELMER_HOME = "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:ELMER_HOME\bin"
}

function Initialize-Gmsh() {
    param( [pscustomobject]$obj )
    $env:GMSH_HOME = "$(Get-PackagePath $obj)"
    Add-ToPath -Directory "$env:GMSH_HOME\bin"
    Add-ToPath -Directory "$env:GMSH_HOME\lib"
    # TODO add to PYTHONPATH;JULIA_LOAD_PATH
}

function Initialize-Kompanion() {
    $config = Get-KompanionConfig
    Add-ToPath -Directory "$env:KOMPANION_BIN"

    Initialize-VSCode  $config.install.vscode
    Initialize-Git     $config.install.git
    Initialize-Lessmsi $config.install.lessmsi
    Initialize-Neovim  $config.install.neovim

    if ($EnableLaTeX) {
        Initialize-Pandoc   $config.install.pandoc
        Initialize-JabRef   $config.install.jabref
        Initialize-Inkscape $config.install.inkscape
        Initialize-MikTeX   $config.install.miktex
    }

    if ($EnableElmer) { Initialize-Elmer $config.install.elmer }
    if ($EnableGmsh)  { Initialize-Gmsh $config.install.gmsh }

    # XXX: languages come last because some packages might override
    # them (especially Python that is used everywhere).
    if ($EnablePython)  { Initialize-Python  $config.install.python }
    if ($EnableJulia)   { Initialize-Julia   $config.install.julia }
    if ($EnableHaskell) { Initialize-Haskell $config.install.stack }
    if ($EnableRacket)  { Initialize-Racket  $config.install.racket }
    if ($EnableMLton)   { Initialize-MLton   $config.install.mlton }
    if ($EnableSMLNJ)   { Initialize-SMLNJ   $config.install.smlnj }

    # TODO pull all submodules!
}
