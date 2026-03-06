# -*- coding: utf-8 -*-
from typing import Any, Self
from numpy.typing import NDArray
import gmsh


class GmshOCCModel:
    """ Wrapper to manage OCC models with an OOP approach. """
    def __init__(self, *,
            render: bool = False,
            name: str = "domain",
            **kws
        ) -> None:
        self._render = render

        if gmsh.is_initialized():
            gmsh.finalize()

        gmsh.initialize()
        gmsh.model.add(name)

        self._model = model = gmsh.model
        self._occ   = occ   = model.occ
        self._mesh  = mesh  = model.mesh

        # Aliases for model operations:
        self.add_physical_group = model.addPhysicalGroup

        # Aliases for OpenCascade geometry kernel:
        self.fragment          = occ.fragment
        self.synchronize       = occ.synchronize
        self.new_rectangle     = occ.addRectangle
        self.new_point         = occ.addPoint
        self.new_line          = occ.addLine
        self.new_curve_loop    = occ.addCurveLoop
        self.new_plane_surface = occ.addPlaneSurface
        self.get_mass          = occ.getMass

        # Aliases for meshing operations:
        self.set_transfinite_curve   = mesh.setTransfiniteCurve
        self.set_transfinite_surface = mesh.setTransfiniteSurface
        self.generate_mesh           = mesh.generate

        # Configure with custom options:
        self.configure(**kws)

    def __enter__(self) -> Self:
        return self

    def __exit__(self, _exc_type, _exc_value, _traceback) -> None:
        # Synchronize the CAD model before finalizing, to ensure all
        # entities are properly created and available for meshing or
        # visualization.
        self.synchronize()

        if self._render:
            gmsh.fltk.run()

        gmsh.finalize()

    def _configure_geometry(self, **kws) -> None:
        """ Configure geometry display options. """
        show_points   = kws.get("show_points", False)
        show_lines    = kws.get("show_lines", True)
        show_surfaces = kws.get("show_surfaces", True)

        self.set_option("Geometry.Points", show_points)
        self.set_option("Geometry.Lines",  show_lines)
        self.set_option("Geometry.Surfaces", show_surfaces)

    def _configure_mesh(self, **kws) -> None:
        """ Configure mesh display options. """
        mesh_size_max  = kws.get("mesh_size_max", None)
        mesh_algorithm = kws.get("mesh_algorithm", 6)
        element_order  = kws.get("element_order", 2)

        self.set_option("Mesh.MeshSizeMax",  mesh_size_max)
        self.set_option("Mesh.Algorithm",    mesh_algorithm)
        self.set_option("Mesh.ElementOrder", element_order)

    def set_option(self, name: str, value: Any) -> None:
        """ Set a raw Gmsh option. """
        if value is None:
            return

        if isinstance(value, bool):
            gmsh.option.setNumber(name, 1 if value else 0)
            return

        if isinstance(value, (int, float)):
            gmsh.option.setNumber(name, value)
            return

        if isinstance(value, str):
            gmsh.option.setString(name, value)
            return

        raise ValueError(f"Unsupported option value type: {type(value)}")

    def configure(self, **kws) -> None:
        """ Configure mesh parameters and display options. """
        self._configure_geometry(**kws)
        self._configure_mesh(**kws)

    def add_points(self, x: NDArray[float], y: NDArray[float]) -> list[int]:
        """ Add all points from lists to the model. """
        point_tags = []

        for xi, yi in zip(x, y):
            pt = self.new_point(xi, yi, 0)
            point_tags.append(pt)

        return point_tags

    def add_lines(self, point_tags: list[int]) -> list[int]:
        """ Add line segments between consecutive points. """
        line_tags = []

        for pi, pj in zip(point_tags[:-1], point_tags[1:]):
            line = self.new_line(pi, pj)
            line_tags.append(line)

        return line_tags

    def get_length(self, line_tag: int) -> float:
        """ Get the length of a line given its tag. """
        return self.get_mass(1, line_tag)

    def get_area(self, surface_tag: int) -> float:
        """ Get the area of a surface given its tag. """
        return self.get_mass(2, surface_tag)

    def get_volume(self, volume_tag: int) -> float:
        """ Get the volume of a 3D entity given its tag. """
        return self.get_mass(3, volume_tag)

    def add_physical_curve(self, *, tags: list[int], name: str,
                           tag_id: int = -1) -> int:
        """ Add a physical curve (1D) group. """
        return self.add_physical_group(1, tags, tag_id, name)

    def add_physical_surface(self, *, tags: list[int], name: str,
                             tag_id: int = -1) -> int:
        """ Add a physical surface (2D) group. """
        return self.add_physical_group(2, tags, tag_id, name)

    def add_physical_volume(self, *, tags: list[int], name: str,
                            tag_id: int = -1) -> int:
        """ Add a physical volume (3D) group. """
        return self.add_physical_group(3, tags, tag_id, name)

    def mesh_and_save(self, filename: str, *, dim: int, **kws) -> None:
        """ Generate mesh and save to file. """
        self._configure_mesh(**kws)
        self.synchronize()
        self.generate_mesh(dim)
        gmsh.write(filename)
