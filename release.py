# -*- coding: utf-8 -*-
import shutil
import sys
from pathlib import Path
from subprocess import run

BUILD_ARGS = [
    "-PythonEnv", "py312",
    "-FromPip",
    "-PackageDist",
    "-FlagRelease",
]

REMOVE_PATHS = [
    "__pycache__",
    "dist",
    "build",
    "majordome.egg-info",
]


def win_to_wsl(path: Path) -> str:
    """ Convert a Windows path to a WSL path. """
    cmd = ["wsl", "wslpath", str(path.as_posix())]
    result = run(cmd, capture_output=True, text=True, check=True)
    return result.stdout.strip()


def run_build_ps1(*args: str) -> None:
    """ Run build.ps1 through PowerShell so subprocess can execute it. """
    shell = shutil.which("pwsh") or shutil.which("powershell")

    if shell is None:
        raise RuntimeError("Could not find PowerShell executable")

    here = Path(__file__).resolve().parent

    cmd = [
        shell,
        "-NoProfile",
        "-ExecutionPolicy", "Bypass",
        "-File", str(here / "build.ps1"),
        *args,
    ]
    run(cmd, cwd=here, check=True)


def main_windows():
    here = Path(__file__).resolve().parent

    for item in REMOVE_PATHS:
        shutil.rmtree(here / item, ignore_errors=True)

    run_build_ps1("-Clean")
    run_build_ps1(*BUILD_ARGS)

    wsl_name = "ubuntu"
    wsl_here = win_to_wsl(here)

    nix = [
        "source ~/.bashrc",
        f"cd {wsl_here}",
        f"bash build.sh {' '.join(BUILD_ARGS)}",
    ]

    cmd = [
        "wsl",
        "-d", wsl_name,
        "--",
        "bash", "-lc",
        " && ".join(nix),
    ]

    run(cmd, check=True)


if __name__ == "__main__":
    if sys.platform.startswith("win"):
        main_windows()
    else:
        print("Only Windows is supported for now")