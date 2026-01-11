"""Read version from Cargo.toml without importing Rust extensions."""
import tomllib
from pathlib import Path


def build_version() -> str:
    """ Get the version from Cargo.toml if the corelib is not built. """
    root = Path(__file__).resolve().parent
    cargo_toml = root / "majordome-corelib/Cargo.toml"

    with open(cargo_toml, "rb") as f:
        data = tomllib.load(f)

    return data["package"]["version"]


__version__ = build_version()
