# -*- coding: utf-8 -*-
from typing import Self
from numpy.typing import NDArray
import gmsh


class GmshOCCModel:
    """ Wrapper to manage OCC models with an OOP approach. """
    def __init__(self, *,
            render: bool = False,
            name: str = "domain"
        ) -> None:
        self._render = render

        if gmsh.is_initialized():
            gmsh.finalize()

        gmsh.initialize()
        gmsh.model.add(name)

        # Aliases for OpenCascade geometry kernel:
        self.fragment          = gmsh.model.occ.fragment
        self.synchronize       = gmsh.model.occ.synchronize
        self.new_rectangle     = gmsh.model.occ.addRectangle
        self.new_point         = gmsh.model.occ.addPoint
        self.new_line          = gmsh.model.occ.addLine
        self.new_curve_loop    = gmsh.model.occ.addCurveLoop
        self.new_plane_surface = gmsh.model.occ.addPlaneSurface

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
