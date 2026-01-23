# -*- coding: utf-8 -*-
from numba import intp
from enum import Enum
from pathlib import Path
from tempfile import NamedTemporaryFile
from pyvista import (
    DataObject,
    UnstructuredGrid,
)
import re
import sys
import subprocess
import warnings
import h5py
import numpy as np
import pyvista as pv


class CgnsMeshHandler:
    """ Handler utilities for CGNS mesh files.

    Notice that this class is highly experimental and depends on external
    utilities. It as been tested with only a few CGNS files and so far the
    developer did not study the CGNS format in depth,
    """
    @staticmethod
    def adf_to_hdf5(
            input_file: str | Path,
            output_file: str | Path,
            force: bool = False
        ) -> None:
        """ Convert CGNS ADF file to HDF5 using `cgnsconvert` utility. """
        if Path(output_file).exists() and not force:
            print(f"File {output_file} already exists, skipping conversion.")
            return

        try:
            cmd = ["cgnsconvert", "-h", str(input_file), str(output_file)]
            subprocess.run(cmd, capture_output=True, text=True, check=True)

        except FileNotFoundError:
            print("Command `cgnsconvert` not found.")

        except subprocess.CalledProcessError as e:
            print(f"Error (code {e.returncode}):\n{e.stderr}")

        finally:
            raise RuntimeError("ADF to HDF5 conversion failed.")

    @staticmethod
    def dig_hdf5_zone_bcs(f: h5py.File) -> list[str]:
        """ Recursively dig into CGNS HDF5 structure to find BC names. """
        zones = []

        for base in f.keys():
            sub1 = f[base]

            if hasattr(sub1, "keys"):
                for entry in sub1.keys():
                    sub2 = sub1[entry]

                    if hasattr(sub2, "keys"):
                        if "ZoneBC" in sub2:
                            print(f"Found ZoneBC under {base}/{entry}")
                            bcs = list(sub2["ZoneBC"].keys())
                            zones.extend(bcs)

        if not zones:
            raise ValueError("No BCs found in CGNS HDF5 file.")

        return zones

    @staticmethod
    def get_hdf5_bcs(
            cgns_file: str | Path,
            where: str | None = None
        ) -> list[str]:
        """ List boundary condition names in a CGNS file. """
        with h5py.File(cgns_file, "r") as f:
            if where is not None:
                return list(f[where].keys())

            return CgnsMeshHandler.dig_hdf5_zone_bcs(f)

    @staticmethod
    def get_bcs(
            input_file: Path,
            output_file: Path | None = None,
            force_conversion: bool = False,
            where: tuple[str, ...] | None = None,
            retry: bool = True
        ) -> list[str]:
        """ Get boundary condition names from CGNS file.

        Parameters
        ----------
        input_file : Path
            Path to the input CGNS file.
        output_file : Path | None
            Path to the output HDF5 file (if conversion is needed). If
            left as None, the output file will have the same name as the
            input file but with .h5 suffix.
        force_conversion : bool
            Whether to force conversion even if the output file exists. It
            is ignored if the input file is already in HDF5 format. Please
            check `cgnslib` utilities and run from command line if needed.
        where : tuple[str, ...] | None
            HDF5 path to the BCs location. If None, the function will
            attempt to find the BCs automatically.
        retry : bool
            Whether to retry finding BCs automatically if not found at the
            specified location.
        """
        input_file = Path(input_file)

        if h5py.is_hdf5(input_file):
            output_file = input_file

        if output_file is None:
            output_file = input_file.with_suffix(".h5")

        try:
            if input_file != output_file:
                CgnsMeshHandler.adf_to_hdf5(input_file, output_file,
                                            force=force_conversion)
        except Exception as e:
            print(f"Error: {e}")

        try:
            if where is None:
                return CgnsMeshHandler.dig_hdf5_zone_bcs(output_file)

            where = "/".join(where)
            got = CgnsMeshHandler.get_hdf5_bcs(output_file, where=where)

            if not got and retry:
                print(f"No BCs found at the specified location, {where}.")
                got = CgnsMeshHandler.get_hdf5_bcs(output_file, where=None)

            return got
        except Exception as e:
            print(f"Error: {e}")

        return []


class PyVistaMeshHandler:
    """ Handler utilities for PyVista mesh files. """
    @staticmethod
    def dig_pyvista_zone_bcs(f: DataObject) -> list[str]:
        """ Recursively dig into PyVista structure to find BC names. """
        zones = []

        if hasattr(f, "keys"):
            if "Patches" in f.keys():
                return list(f["Patches"].keys())

            for name in f.keys():
                found = PyVistaMeshHandler.dig_pyvista_zone_bcs(f[name])
                zones.extend(found)

        return list(set(zones))

    @staticmethod
    def recuse_pyvista_bcs(
            mesh: DataObject,
            tags_addr: tuple[str, ...]
        ) -> list[str]:
        """ Recursively access PyVista mesh tags. """
        tags = mesh

        for key in tags_addr:
            if not hasattr(tags, "keys") or key not in tags.keys():
                print(f"Key '{key}' not found in current tags.")
                return []

            tags = tags[key]

        return list(tags.keys())

    @staticmethod
    def get_bcs(
            f: DataObject,
            where: tuple[str, ...] | None = None,
            retry: bool = True
        ) -> list[str]:
        """ Get boundary condition names from PyVista mesh structure.

        Parameters
        ----------
        f : DataObject
            The PyVista mesh object.
        where : tuple[str, ...] | None
            Path to the BCs location in the mesh structure. If None, the
            function will attempt to find the BCs automatically.
        retry : bool
            Whether to retry finding BCs automatically if not found at the
            specified location.
        """
        if where is None:
            return PyVistaMeshHandler.dig_pyvista_zone_bcs(f)

        try:
            got = PyVistaMeshHandler.recuse_pyvista_bcs(f, where)
        except Exception as e:
            print(f"Error accessing PyVista mesh at {where}: {e}")
            got = []

        if not got and retry:
            print(f"No BCs found at the specified location, {where}.")
            got = PyVistaMeshHandler.dig_pyvista_zone_bcs(f)

        return got


def get_zones_bcs(
        fname: str | Path,
        backend: str = "pyvista",
        **kwargs
    ) -> list[str]:
    """ Get boundary condition names from CGNS mesh file. """
    retry = kwargs.get("retry", True)

    match backend:
        case "cgns":
            where = kwargs.get("where", ("Base", "dom-1", "ZoneBC"))
            zones = CgnsMeshHandler.get_bcs(fname, where=where, retry=retry)
        case "pyvista":
            # XXX: this is not working with HDF5 CGNS files.
            mesh = pv.read(fname)
            where = kwargs.get("where", ("Base", "dom-1", "Patches"))
            zones = PyVistaMeshHandler.get_bcs(mesh, where=where, retry=retry)
        case _:
            raise NotImplementedError(f"Backend '{backend}' not supported.")

    if not zones:
        print(f"No boundary conditions found with `backend={backend}`.")
        backend = "cgns" if backend != "cgns" else "pyvista"
        print(f"Retrying with `backend={backend}`...")
        zones = get_zones_bcs(fname, backend=backend, **kwargs)

    return zones


def su2_def_mesh_conversion(fname: str | Path, **kwargs) -> bool:
    """ Convert CGNS mesh to SU2 format using SU2_DEF utility. """
    backend = kwargs.pop("backend", "cgns")

    name = Path(fname).with_suffix("")
    zones = get_zones_bcs(fname, backend=backend, **kwargs)

    contents = f"""\
    MESH_FORMAT       = CGNS
    MESH_FILENAME     = {name}
    MESH_OUT_FILENAME = {name}
    MARKER_EULER      = ( {", ".join(zones)} )
    """
    with NamedTemporaryFile("w+", suffix=".cfg", delete=True) as tmp:
        tmp.write(contents)
        tmp.flush()

        subprocess.run(["SU2_DEF", tmp.name], check=True)

    return Path(fname).with_suffix(".su2").exists()


class SU2MeshType(Enum):
    """ Enumeration of SU2 mesh types. """
    NONE = "NONE"
    SU2  = "SU2"
    CGNS = "CGNS"


def mesh_su2_tags(fname: str | Path, mesh, **kwargs) -> dict[str, int]:
    """
    Extract all MARKER_TAG names from a SU2 mesh file efficiently.

    Parameters
    ----------
    fname : str | Path
        Path to the SU2 mesh file.
    chunk_size : int
        Size of chunks to read (default 1 MB (1024**2 bits)).
    encoding : str
        File encoding (default 'utf-8').

    Returns
    -------
    dict[str, int]
        All marker tag names and index found in the file.
    """
    chunk_size = kwargs.get("chunk_size", 1048576)
    encoding = kwargs.get("encoding", "utf-8")

    tags = []
    pattern = re.compile(r"MARKER_TAG\s*=\s*(\S+)")

    with open(fname, "r", encoding=encoding, errors="ignore") as f:
        while chunk := f.read(chunk_size):
            tags.extend(pattern.findall(chunk))

    tags_expect = np.unique(mesh.cell_data["su2:tag"])
    tags_map = {t: k for k, t in enumerate(tags, 1)}

    # XXX: +1 for internal tag 0
    if len(tags_expect) != len(tags_map) + 1:
        raise ValueError("Mismatch between expected and found tags.")

    return tags_map


class SU2MeshLoader:
    __slots__ = ("_file", "_mesh", "_boundary_tags", "_boundaries")

    def __init__(self, path: str | Path):
        self._file = Path(path)

        with warnings.catch_warnings():
            warnings.simplefilter("ignore")
            self._mesh = pv.read(path)

    def extract_marker_tags(self, **kwargs) -> dict[str, int]:
        """ Extract all marker names from mesh file.

        Returns
        -------
        dict[str, int]
            All marker tag names and index found in the file.
        """
        match self._file.suffix.lower():
            case ".su2":
                tags_map = mesh_su2_tags(self._file, self._mesh, **kwargs)
            case ".cgns":
                raise NotImplementedError("CGNS format not supported yet.")
            case _:
                raise ValueError("Unsupported file format.")

        self._boundaries = tags_map
        return tags_map

    def to_pyvista(self) -> pv.UnstructuredGrid:
        """
        Convert the SU2 mesh to a PyVista UnstructuredGrid.

        Returns
        -------
        pv.UnstructuredGrid
            The mesh as a PyVista UnstructuredGrid.
        """
        return self._mesh.cast_to_unstructured_grid()

    @property
    def boundary_tags(self) -> pv.UnstructuredGrid:
        """ Get the boundary tags as a PyVista UnstructuredGrid. """
        if not hasattr(self, "_boundary_tags"):
            all_tags = self._mesh.cell_data["su2:tag"]
            external = self._mesh.copy().remove_cells(all_tags == 0)
            self._boundary_tags = external
        return self._boundary_tags

    @property
    def boundaries(self) -> dict[str, int]:
        """ Get the boundary tags as a dictionary. """
        if not hasattr(self, "_boundaries"):
            self.extract_marker_tags()

        return self._boundaries

    def get_tag(self, name: str, **kwargs) -> pv.UnstructuredGrid:
        """ Get a specific boundary tag by name.

        Parameters
        ----------
        name : str
            The name of the boundary tag to retrieve.

        Returns
        -------
        pv.UnstructuredGrid
            The mesh corresponding to the specified boundary tag.
        """
        if not hasattr(self, "_boundaries"):
           self.extract_marker_tags(**kwargs)

        if name not in self._boundaries:
            raise KeyError(f"Boundary tag '{name}' not found.")

        tag_index = self._boundaries[name]
        all_tags = self.boundary_tags.cell_data["su2:tag"]

        return self.boundary_tags.copy().remove_cells(all_tags != tag_index)
