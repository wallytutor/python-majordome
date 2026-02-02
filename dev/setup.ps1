#!/usr/bin/env pwsh

function Ensure-Repository {
    param(
        [string]$RepoUrl,
        [string]$TargetDir
    )

    if (Test-Path "$TargetDir\.git" -PathType Container) {
        Write-Host "Repository $TargetDir exists, pulling latest changes..."
        git -C "$TargetDir" pull
    }
    else {
        Write-Host "Cloning repository $RepoUrl into $TargetDir..."
        git clone "$RepoUrl" "$TargetDir"
    }
}

function Main {
    Write-Host "Setting up SU2 Tutorials and Test Cases..."

    $template = "config_template.cfg"

    if (!(Test-Path $template -PathType Leaf)) {
        Write-Host "Downloading SU2 configuration template..."
        $cfg = "https://raw.githubusercontent.com/su2code/SU2/refs/heads/master/config_template.cfg"
        Invoke-WebRequest -Uri $cfg -OutFile $template
    }
    else {
        Write-Host "Configuration template already exists."
    }

    $tuto = "tuto"
    $test = "test"

    $tutoRepo = "https://github.com/su2code/Tutorials.git"
    $testRepo = "https://github.com/su2code/TestCases.git"

    Ensure-Repository -RepoUrl $tutoRepo -TargetDir $tuto
    Ensure-Repository -RepoUrl $testRepo -TargetDir $test
}

Main @args
