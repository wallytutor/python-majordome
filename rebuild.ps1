Remove-Item -Force -Recurse target
Remove-Item -Force Cargo.lock

uv pip install -e .[docs]
