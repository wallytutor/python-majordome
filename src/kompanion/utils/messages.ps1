# ---------------------------------------------------------------------------
# messages.ps1
# ---------------------------------------------------------------------------

function Write-Head {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Cyan
}

function Write-Warn {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Yellow
}

function Write-Good {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Green
}

function Write-Bad {
    param( [string]$Text )
    Write-Host $Text -ForegroundColor Red
}

# ---------------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------------