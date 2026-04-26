# -*- coding: utf-8 -*-
""" Get the built-time version of the package. """
from packaging.version import Version, InvalidVersion
from subprocess import run, CalledProcessError
from pathlib import Path
import re
import sys

VERSION = "1.0.1"

CARGO_TOML = Path(__file__).resolve().parent / "bindings/rust/Cargo.toml"


def build_version() -> str:
    """ Get the built-time version of the package.

    Note: GitHub actions for some reason yet to be identified does not
    return the correct git describe output, so we fall back to VERSION
    in that case.
    """
    try:
        return get_git_output()
    except (InvalidVersion, CalledProcessError):
        return VERSION


def comply_pep440(version: str) -> str:
    """ Convert a version string to be PEP 440 compliant.

    Convert git describe format to PEP 440 compliant version
    Example: 0.7.0-4-gcedeff5f-dirty -> 0.7.0.post4+gcedeff5f.dirty
    """
    if "-" not in version:
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
    res = run(cmd, capture_output=True, text=True, check=True)
    return str(Version(comply_pep440(res.stdout.strip())))


def update_cargo_version() -> None:
    """Update the [package].version field in Cargo.toml."""
    def find_line_index(lines):
        in_package_section = False
        line_index = -1

        for index, line in enumerate(lines):
            stripped = line.strip()

            if stripped.startswith("[") and stripped.endswith("]"):
                in_package_section = stripped == "[package]"
                continue

            if in_package_section and re.match(r"^\s*version\s*=", line):
                line_index = index
                break

        if line_index == -1:
            raise ValueError(
                f"Could not find [package].version in {CARGO_TOML}"
            )

        return line_index

    def update_version_line(line, expr=r'(^\s*version\s*=\s*)"[^"]*"'):
        return re.sub(expr, rf'\1"{VERSION}"', line)

    lines = CARGO_TOML.read_text(encoding="utf-8").splitlines(keepends=True)

    version_line_index = find_line_index(lines)
    current_line = lines[version_line_index]
    updated_line = update_version_line(current_line)

    if updated_line == current_line:
        print(f"Version in {CARGO_TOML} is already up to date.")
        return

    lines[version_line_index] = updated_line
    CARGO_TOML.write_text("".join(lines), encoding="utf-8")


def tag_version_if_missing() -> None:
    """ Create and push a git tag if it does not already exist. """
    check_cmd = ["git", "rev-parse", "-q", "--verify", f"refs/tags/{VERSION}"]
    check = run(check_cmd, capture_output=True, text=True, check=False)

    if check.returncode == 0:
        print(f"Tag {VERSION} already exists. Skipping tagging.")
        return

    run([
        "git", "tag",
        "-a", VERSION,
        "-m", f"Preparing release of {VERSION}"
    ], check=True)

    run(["git", "push", "origin", "--tags"], check=True)


__version__ = build_version()


if __name__ == "__main__":
    if "-tag" in sys.argv[1:]:
        update_cargo_version()
        tag_version_if_missing()
