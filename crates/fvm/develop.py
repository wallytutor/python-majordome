# -*- coding: utf-8 -*-
""" Build, import, and test the majordome_fvm Python extension. """

import importlib
import sys
import shutil

import numpy as np

from enum import StrEnum
from pathlib import Path
from subprocess import run
from types import ModuleType

from numpy.typing import NDArray

HERE = Path(__file__).parent


class BuildMode(StrEnum):
    """ Crate build mode. """
    DEBUG = "debug"
    RELEASE = "release"


def build_extension(mode: BuildMode) -> Path:
    """ Manage the build of the majordome_fvm crate. """
    mode_name = "--release" if mode == BuildMode.RELEASE else ""
    proc = run(f"cargo build {mode_name}".split(), cwd=HERE, check=True)

    if proc.returncode != 0:
        print(f"Error: Crate build failed with return code {proc.returncode}")
        sys.exit(1)

    return HERE / "target" / mode.value / "majordome_fvm.dll"


def install_extension(mode: BuildMode) -> None:
    """ Build and install the majordome_fvm extension. """
    dll_path = build_extension(mode)

    if not dll_path.exists():
        print(f"Error: Compiled library not found at {dll_path}")
        sys.exit(1)

    pyd_path = dll_path.parent / "majordome_fvm.pyd"
    sys.path.insert(0, str(dll_path.parent))

    if not shutil.copy2(dll_path, pyd_path):
        print(f"Error: Failed to copy {dll_path.name} to {pyd_path.name}")
        sys.exit(1)

    print(f"    Successfully copied {dll_path.name} to {pyd_path.name}")


def import_extension(mode: BuildMode) -> ModuleType:
    """ Import the majordome_fvm extension. """
    print("=" * 70)
    install_extension(mode)

    try:
        majordome_fvm = importlib.import_module("majordome_fvm")

        print("=" * 70)
        print("    Success! majordome_fvm imported successfully.")
        print("")
        print("    Available contents:")

        for x in sorted(dir(majordome_fvm)):
            if x.startswith("_"):
                continue
            print(f"    - {x}")

        print("=" * 70)
    except ImportError as e:
        print(f"Failed to import majordome_fvm: {e}")
        sys.exit(1)

    return majordome_fvm


_fvm = import_extension(BuildMode.DEBUG)


class ImmersedNodeDomain1D:
    __doc__ = _fvm.domain1d.ImmersedNodeDomain1D.__doc__

    __slots__ = ["_obj"]

    def __init__(self, *args, **kwargs) -> None:
        self._obj = _fvm.domain1d.ImmersedNodeDomain1D(*args, **kwargs)

    def __str__(self) -> str:
        return str(self._obj)

    def __repr__(self) -> str:
        return repr(self._obj)

    def __len__(self) -> int:
        return self._obj.len()

    def to_array(self) -> NDArray[np.float64]:
        return np.array(self._obj.to_array())

    @property
    def cell_sizes(self) -> NDArray[np.float64]:
        return np.array(self._obj.cell_sizes)

    @property
    def spacing(self) -> NDArray[np.float64]:
        return np.array(self._obj.spacing)

    @property
    def interior(self) -> NDArray[np.float64]:
        return np.array(self._obj.interior)

    @property
    def west_boundary(self) -> float:
        return self._obj.west_boundary

    @property
    def east_boundary(self) -> float:
        return self._obj.east_boundary



if __name__ == "__main__":
    domain = ImmersedNodeDomain1D(1.0, 10, shift=1)
    print(domain)

    domain = ImmersedNodeDomain1D(1.0, 10, first_size=0.1, last_size=0.2)
    print(domain)

    domain = ImmersedNodeDomain1D(1.0, 10, first_size=0.1, last_size=None)
    print(domain)