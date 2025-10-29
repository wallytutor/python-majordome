### PARAMETERS

param ([int]$CleanLevel = 2)

### CONVERT

$bookDir = "$(Split-Path -Path $PSScriptRoot -Parent)\src"

$files = @(
    "$bookDir\computing\introduction.md"
    "$bookDir\computing\tools-git.md"
    "$bookDir\computing\tools-ssh.md"
    "$bookDir\computing\tools-containers.md"
    "$bookDir\computing\tools-selection.md"
    "$bookDir\computing\tools-portable.md"
    "$bookDir\computing\system-windows.md"
    "$bookDir\computing\system-linux.md"
    "$bookDir\computing\ansys-fluent\tui.md"
    "$bookDir\computing\elmer-csc\elmer.md"
    "$bookDir\computing\general-tips.md"
    "$bookDir\computing\services.md"
    "$bookDir\programming\introduction.md"
    "$bookDir\programming\julia.md"
    "$bookDir\programming\racket.md"
    "$bookDir\programming\haskell.md"
    "$bookDir\programming\other.md"
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