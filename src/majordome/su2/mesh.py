# -*- coding: utf-8 -*-
from pathlib import Path
import re
import warnings
import pyvista as pv


class SU2MeshLoader:
    __slots__ = ("_file", "_mesh")

    def __init__(self, path: str | Path):
        self._file = Path(path)

        with warnings.catch_warnings():
            warnings.simplefilter("ignore", category=Warning)
            self._mesh = pv.read(path)

    def extract_marker_tags(self, chunk_size: int = 1048576,
                            encoding: str = "utf-8") -> dict[str, int]:
        """
        Extract all MARKER_TAG names from a SU2 mesh file efficiently.

        Parameters
        ----------
        chunk_size : int
            Size of chunks to read (default 1 MB (1024**2 bits)).

        Returns
        -------
        dict[str, int]
            All marker tag names and index found in the file.
        """
        # TODO handle CGNS files by extension type

        tags = []
        pattern = re.compile(r"MARKER_TAG\s*=\s*(\S+)")

        with open(self._file, "r", encoding=encoding, errors="ignore") as f:
            while chunk := f.read(chunk_size):
                tags.extend(pattern.findall(chunk))

        return {t: k for k, t in enumerate(tags, 1)}

    def to_pyvista(self) -> pv.UnstructuredGrid:
        """
        Convert the SU2 mesh to a PyVista UnstructuredGrid.

        Returns
        -------
        pv.UnstructuredGrid
            The mesh as a PyVista UnstructuredGrid.
        """
        return self._mesh.cast_to_unstructured_grid()
