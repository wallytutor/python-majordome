# -*- coding: utf-8 -*-
from enum import Enum
from pathlib import Path
import re
import warnings
import numpy as np
import pyvista as pv


class SU2MeshType(Enum):
    """ Enumeration of SU2 mesh types. """
    NONE = "NONE"
    SU2  = "SU2"
    CGNS = "CGNS"


class SU2MeshLoader:
    __slots__ = ("_file", "_mesh", "_boundary_tags", "_boundaries")

    def __init__(self, path: str | Path):
        self._file = Path(path)

        with warnings.catch_warnings():
            warnings.simplefilter("ignore")
            self._mesh = pv.read(path)

    def extract_marker_tags(self,
            chunk_size: int = 1048576,
            encoding: str = "utf-8"
        ) -> dict[str, int]:
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

        tags_expect = np.unique(self._mesh.cell_data["su2:tag"])
        tags_map = {t: k for k, t in enumerate(tags, 1)}

        # XXX: +1 for internal tag 0
        if len(tags_expect) != len(tags_map) + 1:
            raise ValueError("Mismatch between expected and found tags.")

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
