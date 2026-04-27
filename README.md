# Majordome

General utilities for scientific Python and numerical simulation.

Please refer to the [Majordome docs](https://wallytutor.github.io/python-majordome) for details.


-  Build the package:

```bash
uv build --wheel
```

- Inspect the wheel:

```bash
python -m zipfile -l dist/majordome-1.0.0-cp312-abi3-win_amd64.whl
```

- Create a virtual environment:

```bash
uv venv --python python3.12 .venv
```

- Activate the virtual environment:

```bash
# Windows:
. .venv/Scripts/activate

# Unix:
. .venv/bin/activate
```

- Install the package:

```bash
uv pip install "./dist/*.whl[docs]"
```

- Point Quarto to the virtual environment:

```bash
# Windows:
$env:QUARTO_PYTHON = ".venv/Scripts/python.exe"

# Unix:
export QUARTO_PYTHON=".venv/bin/python"
```

- Generate the docs:

```bash
quarto render docs
```

- Publish the docs:

```bash
quarto publish gh-pages --no-prompt --no-browser docs
```
