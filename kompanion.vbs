Set objShell = CreateObject("Wscript.Shell")
Dim pShell, kommand

pShell = "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "
kommand = ". src/kompanion/main.ps1"

objShell.Run pShell & kommand, 0, True
