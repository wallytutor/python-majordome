# -*- coding: utf-8 -*-
from typing import Any, Self
from numpy.typing import NDArray
import gmsh
import numpy as np

# Do not annotate with numbers.Number, that always end up with some
# linting issues. Just use a union of common numeric types instead.
AnyNumber = int | float | np.number
TrupleAny = tuple[AnyNumber, AnyNumber, AnyNumber]
PlaneEquationAny = tuple[AnyNumber, AnyNumber, AnyNumber, AnyNumber]

CUSTOM_DEFAULT_OPTIONS = {
    "Mesh.CharacteristicLengthMin": None,
    "Mesh.CharacteristicLengthMax": None,
    "Mesh.SaveAll": None,
    "Mesh.SaveGroupsOfNodes": None,
    "Mesh.MeshSizeMax": None,
    "Mesh.Algorithm": 6,
    "Mesh.ElementOrder": 2,
    "Geometry.Points": False,
    "Geometry.Lines": True,
    "Geometry.Surfaces": True,
}


class GmshOCCModel:
    """ Wrapper to manage OCC models with an OOP approach.

    Parameters
    ----------
    render : bool, optional
        Whether to launch the Gmsh GUI after building the model.
    name : str, optional
        Name of the Gmsh model.
    ks : dict
        Provide configuration for gmsh internals.
    """
    def __init__(self, *, render: bool = False, name: str = "domain",
                 **kws) -> None:
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

        # XXX: when using aliases, prefer the original name of the method
        # if it is PEP8 compliant. If the original name uses camelCase,
        # then the alias should be in snake_case. Otherwise, when actually
        # wrapping a method in this class, use a new name that reflects
        # the intent plus the original name, e.g. `transform_dilate`
        # instead of `dilate`.

        # Aliases for OpenCascade geometry kernel:
        # - basic geometry entities:
        self.add_point         = occ.addPoint
        self.add_line          = occ.addLine

        # - construction geometry entities:
        self.add_circle_arc    = occ.addCircleArc
        self.add_rectangle     = occ.addRectangle

        # - add higher-level geometry entities:
        self.add_curve_loop    = occ.addCurveLoop
        self.add_plane_surface = occ.addPlaneSurface

        # - operations on geometry entities:
        self.fuse              = occ.fuse
        self.remove            = occ.remove
        self.fragment          = occ.fragment
        self.extrude           = occ.extrude
        self.synchronize       = occ.synchronize
        self.translate         = occ.translate

        # - query geometry properties:
        self.get_mass          = occ.getMass

        # Aliases for meshing operations:
        self.set_transfinite_curve   = mesh.setTransfiniteCurve
        self.set_transfinite_surface = mesh.setTransfiniteSurface
        self.set_recombine           = mesh.setRecombine
        self.set_size                = mesh.setSize
        self.generate_mesh           = mesh.generate

        # Configure with custom options:
        options = CUSTOM_DEFAULT_OPTIONS.copy()
        options.update(kws)
        self.configure(**options)

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
        for key, value in kws.items():
            self.set_option(key, value)

    def add_points(self,
                   x: NDArray[np.float64],
                   y: NDArray[np.float64]
                   ) -> list[int]:
        """ Add all points from lists to the model. """
        point_tags = []

        for xi, yi in zip(x, y):
            pt = self.add_point(xi, yi, 0)
            point_tags.append(pt)

        return point_tags

    def add_lines(self, point_tags: list[int]) -> list[int]:
        """ Add line segments between consecutive points. """
        line_tags = []

        for pi, pj in zip(point_tags[:-1], point_tags[1:]):
            line = self.add_line(pi, pj)
            line_tags.append(line)

        return line_tags

    def transform_dilate(self,
            dimtags: list[tuple[int, int]],
            factors: TrupleAny | AnyNumber,
            origin: TrupleAny = (0, 0, 0)
        ) -> None:
        """ Dilate geometry entities by given factors from the origin.

        Parameters
        ----------
        dimtags : list[tuple[int, int]]
            List of (dimension, tag) pairs for the entities to dilate.
        factors : TrupleAny | AnyNumber
            Scaling factors for each axis (x, y, z) or a single uniform factor.
        origin : TrupleAny, optional
            Origin point for the dilation, default is (0, 0, 0).
        """
        if isinstance(factors, (int, float, np.number)):
            factors = (factors, factors, factors)

        self._occ.dilate(dimtags, *origin, *factors)

    def transform_symmetrize(self,
            dimtags: list[tuple[int, int]],
            plane_equation: PlaneEquationAny | None = None,
            axis: str | None = None,
            copy: bool = False
        ) -> None:
        """ Symmetrize geometry entities across a plane defined by its equation.

        Parameters
        ----------
        dimtags : list[tuple[int, int]]
            List of (dimension, tag) pairs for the entities to symmetrize.
        plane_equation : PlaneEquationAny, optional
            Coefficients (a, b, c, d) of the plane equation ax+by+cz+d=0.
            If not provided, 'axis' must be specified.
        axis : str, optional
            Axis of symmetry ('x', 'y', or 'z'). If provided, it defines a plane perpendicular to that axis through the origin. If not
            provided, 'plane_equation' must be specified.
        copy : bool, optional
            Whether to keep the original entities (True) or replace them
            with their symmetric counterparts (False). Default is False.
        """
        if plane_equation is None and axis is None:
            raise ValueError("At least one of 'plane_equation' or "
                             "'axis' must be provided.")

        if plane_equation is not None and axis is not None:
            raise ValueError("Only one of 'plane_equation' or 'axis' "
                             "can be provided, not both.")

        if axis is not None:
            match axis.lower():
                case "x":
                    plane_equation = (1, 0, 0, 0)  # x = 0 plane

                case "y":
                    plane_equation = (0, 1, 0, 0)  # y = 0 plane
                case "z":
                    plane_equation = (0, 0, 1, 0)  # z = 0 plane
                case _:
                    raise ValueError(f"Invalid axis '{axis}'. Must be "
                                     "'x', 'y', or 'z'.")

        # Should never be true?!
        if plane_equation is None:
            raise ValueError("Plane equation must be defined at this point.")

        usedims = self._occ.copy(dimtags) if copy else dimtags
        self._occ.symmetrize(usedims, *plane_equation)

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
        self.synchronize()
        self.generate_mesh(dim)
        gmsh.write(filename)

    def dump(self, *args):
        """" Dump the mesh to files with given names. """
        self.synchronize()

        for arg in args:
            gmsh.write(arg)


class GeometricProgression:
    """ Create a geometric progression for meshing control.

    Parameters
    ----------
    n : int
        Number of segments.
    d0 : float
        First segment length.
    d1 : float
        Last segment length. If not provided, `q` must be provided.
    q : float
        Geometric progression ratio. If `d1` is provided, `q` is
        computed to fit `n` segments from `d0` to `d1`.
    tol : float
        Tolerance for detecting q ≈ 1 when computing progression sum.
    """
    def __init__(self, n: int, d0: float, *, d1: float | None = None,
                 q: float | None = None, tol: float = 1e-14):
        if q is None and d1 is not None:
            q = self.ratio(n, d0, d1)
        elif q is None:
            raise ValueError("Either q or d1 must be provided")

        self.n = n
        self.q = q
        self.d0 = d0
        self.tol = tol

    def sum(self) -> float:
        """ Sum of geometric progression series. """
        if abs(1.0 - self.q) < self.tol:
            return self.n * self.d0
        return self.d0 * (1.0 - self.q**self.n) / (1.0 - self.q)

    @staticmethod
    def ratio(n: int, d0: float, d1: float) -> float:
        """ Geometric progression ratio for `n` segments from `d0` to `d1`.

        Parameters
        ----------
        n : int
            Number of segments.
        d0 : float
            First segment length.
        d1 : float
            Last segment length.
        """
        return (d1 / d0) ** (1.0 / (n - 1))

    @classmethod
    def fit(cls, radius: float, d0: float, d1: float,
            min_nodes: int = 2, max_nodes: int = 1000,
            tol: float = 1.0e-15) -> tuple[int, float]:
        """ Best number of segments to fit a progression within a radius.

        Parameters
        ----------
        radius : float
            Target total length to fit.
        d0 : float
            First segment length.
        d1 : float
            Last segment length.
        min_nodes : int
            Minimum number of segments to consider.
        max_nodes : int
            Maximum number of segments to consider.
        tol : float
            Tolerance for detecting q ≈ 1 when computing progression sum.
        """
        def loss(n: int) -> float:
            return abs(radius - cls(n, d0, d1=d1, tol=tol).sum())

        best_n = min(range(min_nodes, max_nodes), key=loss)
        return best_n, cls.ratio(best_n, d0, d1)

    @classmethod
    def fit_bump(cls,
            length: float,
            d_end: float,
            d_mid: float,
            *,
            min_nodes: int = 4,
            max_nodes: int = 1000,
            tol: float = 1.0e-12,
            rtol: float = 1.0e-9
        ) -> tuple[int, float]:
        """ Best number of segments to fit a bump within a radius.

        Please notice that a Gmsh bump coefficient is symmetric on both
        ends, so a single `d_end` value is used for both the start and end of the curve. This returns `(n, coef)` for:
        `setTransfiniteCurve(curve, n + 1, "Bump", coef)`.

        Parameters
        ----------
        length : float
            Total curve length.
        d_end : float
            Target edge cell size at the end.
        d_mid : float
            Target cell size near curve middle.
        min_nodes : int
            Minimum number of segments to consider.
        max_nodes : int
            Maximum number of segments to consider.
        tol : float
            Absolute tolerance used in progression sums.
        """
        if min_nodes < 2:
            raise ValueError("min_nodes must be >= 2")

        if max_nodes <= min_nodes:
            raise ValueError("max_nodes must be > min_nodes")

        if d_end <= 0 or d_mid <= 0:
            raise ValueError("Cell sizes must be positive.")

        def bump_sum(n: int) -> float:
            left_count = n // 2 + n % 2
            q = cls.ratio(left_count, d_end, d_mid)
            half = cls(left_count, d_end, q=q, tol=tol).sum()
            return 2.0 * half - (d_mid if n % 2 else 0.0)

        best_n = min(range(min_nodes, max_nodes),
                     key=lambda n: abs(length - bump_sum(n)))

        return best_n, d_end / d_mid
