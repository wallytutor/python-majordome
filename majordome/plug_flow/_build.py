# -*- coding: utf-8 -*-
import os
from pathlib import Path
import platform
import shutil
import subprocess
import sys
import sysconfig
from typing import List, Tuple

MODULE_DIR = Path(__file__).resolve().parent
ROOT_DIR = MODULE_DIR.parents[1]
SRC_DIR = ROOT_DIR / "src" / "pluglib"


def _find_cantera_flags() -> Tuple[bool, List[str], List[str]]:
    """ Locate Cantera C++ compiler flags and libraries.

    Returns
    -------
    tuple
        Tuple of (found, include_flags, library_flags).
    """
    if platform.system() != "Linux":
        return False, [], []

    pkg_cfg = shutil.which("pkg-config")

    if pkg_cfg is not None:
        try:
            check_res = subprocess.run(
                [pkg_cfg, "--exists", "cantera"],
                capture_output=True,
                check=False
            )

            if check_res.returncode == 0:
                cflags_res = subprocess.run(
                    [pkg_cfg, "--cflags", "cantera"],
                    capture_output=True,
                    text=True,
                    check=False
                )
                libs_res = subprocess.run(
                    [pkg_cfg, "--libs", "cantera"],
                    capture_output=True,
                    text=True,
                    check=False
                )
                cflags = cflags_res.stdout.strip().split()
                libs = libs_res.stdout.strip().split()

                extra_libs = [
                    "-lsundials_ida",
                    "-lsundials_nvecserial",
                    "-lopenblas",
                    "-llapack",
                    "-lpthread"
                ]

                for elib in extra_libs:
                    if elib not in libs:
                        libs.append(elib)

                return True, cflags, libs
        except (OSError, subprocess.SubprocessError):
            pass

    search_prefixes = [
        Path("/usr/local"),
        Path("/usr"),
        Path("/opt/cantera"),
    ]

    env_root = os.environ.get("CANTERA_ROOT")

    if env_root:
        search_prefixes.insert(0, Path(env_root))

    header_subpath = Path("include/cantera/base/ctexceptions.h")
    found_prefix = None

    for pfx in search_prefixes:
        if (pfx / header_subpath).exists():
            found_prefix = pfx
            break

    if found_prefix is None:
        return False, [], []

    inc_dirs = [
        f"-I{found_prefix / "include"}",
        "-I/usr/include/eigen3",
        "-I/usr/lib/x86_64-linux-gnu/openmpi/include",
        "-I/usr/include/hdf5/serial"
    ]

    lib_dirs = [
        f"-L{found_prefix / "lib"}",
        f"-Wl,-rpath,{found_prefix / "lib"}",
        "-L/usr/lib/x86_64-linux-gnu/openmpi/lib",
        "-lcantera_shared",
        "-lsundials_ida",
        "-lsundials_nvecserial",
        "-lopenblas",
        "-llapack",
        "-lpthread"
    ]

    return True, inc_dirs, lib_dirs


def build_plug_flow(strict: bool = False) -> bool:
    """ Build the ct_pfr C++ extension if Cantera is detected.

    Parameters
    ----------
    strict : bool = False
        If True, raise on compilation failure.

    Returns
    -------
    bool
        True if built or skipped gracefully, False on build failure.
    """
    found, cantera_inc, cantera_libs = _find_cantera_flags()

    if not found:
        print(
            "[majordome.plug_flow] Cantera C++ development libraries "
            "not detected. Skipping plug_flow compilation."
        )
        return True

    cxx = os.environ.get("CXX", "g++")

    if shutil.which(cxx) is None:
        print(
            f"[majordome.plug_flow] Compiler {cxx} not found. "
            "Skipping plug_flow compilation."
        )
        return True

    try:
        import numpy as np
        numpy_inc = f"-I{np.get_include()}"
    except ImportError:
        numpy_inc = ""

    py_inc = f"-I{sysconfig.get_path("include")}"
    ext_suffix = sysconfig.get_config_var("EXT_SUFFIX") or ".so"
    out_file = MODULE_DIR / f"ct_pfr{ext_suffix}"

    cxx_sources = [
        str(MODULE_DIR / "ct_pfr.cpp"),
        str(SRC_DIR / "AdiabaticPFR.cpp"),
        str(SRC_DIR / "HeatWallPFR.cpp"),
        str(SRC_DIR / "IsothermalPFR.cpp"),
    ]

    for src_path in cxx_sources:
        if not Path(src_path).exists():
            print(
                f"[majordome.plug_flow] Source file missing: {src_path}. "
                "Skipping compilation."
            )
            return True

    cmd = [
        cxx,
        "-shared",
        "-fPIC",
        "-std=c++17",
        "-O3",
        f"-I{SRC_DIR}",
        py_inc,
    ]

    if numpy_inc:
        cmd.append(numpy_inc)

    cmd.extend(cantera_inc)
    cmd.extend(cxx_sources)
    cmd.extend(cantera_libs)
    cmd.extend(["-o", str(out_file)])

    print(f"[majordome.plug_flow] Compiling {out_file.name}...")

    res = subprocess.run(cmd, capture_output=True, text=True, check=False)

    if res.returncode == 0:
        print("[majordome.plug_flow] Extension compiled successfully.")
        return True

    msg = (
        f"[majordome.plug_flow] Build failed with code {res.returncode}:\n"
        f"{res.stderr}"
    )
    print(msg)

    if strict:
        raise RuntimeError(msg)

    return False


if __name__ == "__main__":
    is_strict = os.environ.get("MAJORDOME_STRICT_BUILD", "0") == "1"
    success = build_plug_flow(strict=is_strict)
    sys.exit(0 if success else 1)
