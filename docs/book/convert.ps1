### PARAMETERS

param ([int]$CleanLevel = 2)

### CONVERT

$bookDir = "$(Split-Path -Path $PSScriptRoot -Parent)\src\computing"

$files = @(
    "$bookDir\introduction.md"
    "$bookDir\tools-git.md"
    "$bookDir\tools-ssh.md"
    "$bookDir\tools-containers.md"
    "$bookDir\tools-selection.md"
    "$bookDir\system-windows.md"
    "$bookDir\system-linux.md"
    "$bookDir\programming\introduction.md"
    "$bookDir\programming\julia.md"
    "$bookDir\programming\racket.md"
    "$bookDir\ansys-fluent\tui.md"
    "$bookDir\elmer-csc\elmer.md"
    "$bookDir\general-tips.md"
)

    # README.md                 `
pandoc                        `
    $files                    `
    --metadata-file=book.yaml `
    --template=book.tex       `
    --biblatex                `
    --pdf-engine=xelatex      `
    -o "book_.tex"

### BUILD

xelatex "book_.tex"
biber   "book_"
xelatex "book_.tex"
xelatex "book_.tex"

### CLEAN

if ($CleanLevel -gt 0) {
    $rmpaths = @("*.aux", "*.bbl", "*.bcf", "*.blg", "*.run.xml", "*.toc")
    Remove-Item $rmpaths -Recurse -Force -ErrorAction SilentlyContinue
}

if ($CleanLevel -gt 1) {
    $rmpaths = @("*.log", "book_.tex")
    Remove-Item $rmpaths -Recurse -Force -ErrorAction SilentlyContinue
}

### EOF