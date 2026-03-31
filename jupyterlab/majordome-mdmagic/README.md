# @majordome/jupyterlab-mdmagic

JupyterLab 4 frontend extension that improves editing ergonomics for Majordome's `%%md` cell magic.

## Current behavior

- If a code cell starts (ignoring blank lines and Quarto `#|` lines) with `%%md`, the editor mime type switches away from Python.
- The extension uses:
  - `text/markdown` for general `%%md` content.
  - `text/x-latex` when the post-magic body looks like a pure `$$...$$` display-math block.
- In `%%md` cells, CodeMirror 6 decorations highlight `{expr}` placeholders with dedicated styling.
- If a cell is no longer a `%%md` cell, the original mime type is restored.

## Dev setup

```bash
cd jupyterlab/majordome-mdmagic
npm install
npm run build
```

## Install in JupyterLab (dev mode)

```bash
cd jupyterlab/majordome-mdmagic
jupyter labextension link .
jupyter lab
```

## PowerShell helper

You can run the helper script from this folder:

```powershell
.\dev.ps1
```

Default behavior is: setup dependencies, build, link extension, then show status.

Useful options:

```powershell
.\dev.ps1 -Status
.\dev.ps1 -Unlink
.\dev.ps1 -Build -Link
.\dev.ps1 -Watch
```

To remove the development link:

```bash
jupyter labextension unlink .
```

## Why not `develop`?

In some Jupyter setups, `jupyter labextension develop . --overwrite` expects a
Python package in the current directory and tries to call `setup.py`. This
scaffold is frontend-only, so `link` is the correct workflow.

## Notes

The extension includes CodeMirror 6 decorations for `{expr}` placeholders only in `%%md` cells, so regular Python cells keep normal highlighting behavior.
