# -*- coding: utf-8 -*-
""" Get the built-time version of the package. """
from pathlib import Path
import subprocess
import tomllib


def build_version() -> str:
    """ Get the built-time version of the package. """
    try:
        return get_git_output()
    except subprocess.CalledProcessError:
        return get_cargo_version()


def comply_pep440(version: str) -> str:
    """ Convert a version string to be PEP 440 compliant.

    Convert git describe format to PEP 440 compliant version
    Example: 0.7.0-4-gcedeff5f-dirty -> 0.7.0.post4+gcedeff5f.dirty
    """
    if '-' not in version:
        return version

    parts = version.split("-")

    if len(parts) < 3:
        return version

    # parts[0] = tag (e.g., "0.7.0")
    # parts[1] = commits since tag (e.g., "4")
    # parts[2] = git hash (e.g., "gcedeff5f")
    # parts[3] = "dirty" (if present)
    base     = parts[0]
    commits  = parts[1]
    git_hash = parts[2]
    dirty    = ""

    if len(parts) > 3 and parts[3] == "dirty":
        dirty = ".dirty"

    return f"{base}.post{commits}+{git_hash}{dirty}"


def get_git_output() -> str:
    """ Get the version from git tags. """
    cmd = ["git", "describe", "--tags", "--always", "--dirty"]
    res = subprocess.run(cmd, capture_output=True, text=True, check=True)
    return comply_pep440(res.stdout.strip())


def get_cargo_version() -> str:
    """ Get the version from Cargo.toml. """
    root = Path(__file__).resolve().parent
    cargo_toml = root / "majordome-corelib/Cargo.toml"

    with open(cargo_toml, "rb") as fp:
        data = tomllib.load(fp)

    return data["package"]["version"]


__version__ = build_version()
