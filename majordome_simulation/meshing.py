# -*- coding: utf-8 -*-
from typing import Any, Self
from numpy.typing import NDArray
import itertools
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

        self._aliases()

        # Configure with custom options:
        options = CUSTOM_DEFAULT_OPTIONS.copy()
        options.update(kws)
        self.configure(**options)

    def _aliases(self):
        """ Aliases for the Gmsh API to simplify usage. """
        self._model = model = gmsh.model
        self._occ   = occ   = model.occ
        self._mesh  = mesh  = model.mesh

        # Aliases for model operations:
        self.get_boundary       = model.getBoundary
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

    #region: common geometry constructions
    def hexagon_xy(self,
            center_to_wall: float,
            origin: tuple[float, float, float] | None = None,
            rotation: float | None = None
        ) -> int:
        """ Create a hexagon in the XY plane. """
        pts = hexagon_points_xy(center_to_wall, origin, rotation)

        point_tags = []
        line_tags = []

        for i in range(6):
            pt = self.add_point(*pts[i])
            point_tags.append(pt)

            if i > 0:
                line = self.add_line(point_tags[i-1], point_tags[i])
                line_tags.append(line)

        line = self.add_line(point_tags[-1], point_tags[0])
        line_tags.append(line)
        self.synchronize()

        loop = self.add_curve_loop(line_tags)
        surf = self.add_plane_surface([loop])
        self.synchronize()

        return surf



    #endregion: common geometry constructions


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



class CircularCrossSection:
    # """ Circular cross-section with optional square inner region.

    # Parameters
    # ----------
    # radius : float
    #     Outer radius of the circular cross-section.
    # cell_size_boundary : float
    #     Target cell size near the circular boundary.
    # cell_size_center : float
    #     Target cell size near the center of the cross-section.
    # num_points_angular : int, optional
    #     Number of points to define the circular boundary.
    # square_side : float, optional
    #     Size of the inner square region. If not provided, it defaults
    #     to `radius / 4`.
    # origin : tuple[float, float, float], optional
    #     Origin point for the cross-section center, default is (0, 0, 0).
    # kws : dict
    #     Additional keyword arguments for mesh configuration, passed to
    #     `GeometricProgression.fit`.
    # """
    # __slots__ = (
    #     "_radius",
    #     "_cell_bo",
    #     "_cell_bi",
    #     "_num_points_angular",
    #     "_square_side",
    #     "_origin",
    # )

    def __init__(self,
            radius: float,
            boundary_thickness: float,
            cell_size_boundary: float,
            cell_size_center: float,
            num_points_angular: int | None = None,
            origin: tuple[float, float, float] | None = None,
            n_splits: int = 8,
            **kws
        ) -> None:
        if origin is None:
            origin = (0, 0, 0)

        self._n = n_splits

        self._r_out  = radius
        self._r_in   = radius - boundary_thickness
        self._origin = origin

        self._d0 = cell_size_boundary
        self._d1 = cell_size_center

        if num_points_angular is None:
            num_points_angular = int(self._r_in // self._d1)

        self._n_angular = num_points_angular

    def _create_ring_boundary(self, model: GmshOCCModel):
        ###
        # Iteration 0: create the 0D elements
        ###

        p_origin = model.add_point(*self._origin)

        p_cout = points_on_circle(self._r_out, self._n, self._origin)
        p_cin  = points_on_circle(self._r_in,  self._n, self._origin)

        p_tags_cout = [model.add_point(*pt) for pt in p_cout]
        p_tags_cin  = [model.add_point(*pt) for pt in p_cin]

        bl = self._r_out - self._r_in
        nn, q = GeometricProgression.fit(bl, self._d0, self._d1)

        def add_arc(p_start, p_end):
            return model.add_circle_arc(p_start, p_origin, p_end)

        ###
        # Iteration 1: create the 1D elements
        ###

        points_i = itertools.cycle(range(self._n))
        points_j = itertools.cycle(range(self._n))
        next(points_j)  # j starts one step ahead of i

        l_tags_cout   = []
        l_tags_cin    = []
        l_tags_chords = []

        for _ in range(self._n):
            i = next(points_i)
            j = next(points_j)

            pcout_i = p_tags_cout[i]
            pcout_j = p_tags_cout[j]

            pcin_i  = p_tags_cin[i]
            pcin_j  = p_tags_cin[j]

            l_cout  = add_arc(pcout_i, pcout_j)
            l_cin   = add_arc(pcin_i, pcin_j)
            l_chord = model.add_line(pcout_i, pcin_i)

            l_tags_cout.append(l_cout)
            l_tags_cin.append(l_cin)
            l_tags_chords.append(l_chord)

            model.synchronize()
            model.set_transfinite_curve(l_cout, self._n_angular)
            model.set_transfinite_curve(l_cin,  self._n_angular)
            model.set_transfinite_curve(l_chord, nn, "Progression", q)

        ###
        # Iteration 2: create the 2D elements
        ###

        points_i = itertools.cycle(range(self._n))
        points_j = itertools.cycle(range(self._n))
        next(points_j)  # j starts one step ahead of i

        surf_tags = []

        for _ in range(self._n):
            i = next(points_i)
            j = next(points_j)

            loop = [
                l_tags_chords[i],
                l_tags_cout[i],
                -l_tags_chords[j],
                -l_tags_cin[i]
            ]
            loop_tag = model.add_curve_loop(loop)
            surf_tag = model.add_plane_surface([loop_tag])
            surf_tags.append(surf_tag)

            model.synchronize()
            model.set_transfinite_surface(surf_tag)
            model.set_recombine(2, surf_tag)

        model.synchronize()
        return surf_tags, l_tags_cin, l_tags_cout, p_tags_cin, p_tags_cout

    def _create_simple_core(self, model: GmshOCCModel,
                            tags_inner_lines: list[int]):
        loop_tag = model.add_curve_loop(tags_inner_lines)
        surf_tag = model.add_plane_surface([loop_tag])

        model.synchronize()
        model.set_recombine(2, surf_tag)

        len_arc = 2 * np.pi * self._r_in / self._n
        len_step = len_arc / self._n_angular

        size_min = len_step
        # size_max = min(len_step * 10, self._r_in / 2)
        size_max = 0.01

        dist_min = self._d1
        dist_max = self._r_in

        print(f"len_arc={len_arc:.3e}, len_step={len_step:.3e}, "
              f"size_min={size_min:.3e}, size_max={size_max:.3e}, dist_max={dist_max:.3e}")

        n_samples = max(100, self._n * self._n_angular)

        model._mesh.field.add("Distance", 1)
        model._mesh.field.setNumbers(1, "CurvesList", tags_inner_lines)
        model._mesh.field.setNumber(1, "Sampling", n_samples)

        model._mesh.field.add("Threshold", 2)
        model._mesh.field.setNumber(2, "InField", 1)
        model._mesh.field.setNumber(2, "DistMin", dist_min)
        model._mesh.field.setNumber(2, "DistMax", dist_max)
        model._mesh.field.setNumber(2, "SizeMin", size_min)
        model._mesh.field.setNumber(2, "SizeMax", size_max)
        model._mesh.field.setNumber(2, "StopAtDistMax", 1)

        # model._mesh.field.add("Min", 3)
        # model._mesh.field.setNumbers(3, "FieldsList", [2])
        model._mesh.field.setAsBackgroundMesh(2)
        model.synchronize()

    def _create_polygonal_core(self, model: GmshOCCModel,
                               tags_inner_lines: list[int],
                               tags_inner_points: list[int],
                               structured: bool = False):
        ###
        # Iteration 0: create the 0D elements
        ###

        p_core = points_on_circle(self._r_in / 2, self._n, self._origin)
        p_tags_core = [model.add_point(*pt) for pt in p_core]

        ###
        # Iteration 1: create the 1D elements
        ###

        points_i = itertools.cycle(range(self._n))
        points_j = itertools.cycle(range(self._n))
        next(points_j)  # j starts one step ahead of i

        l_tags_core   = []
        l_tags_chords = []

        for _ in range(self._n):
            i = next(points_i)
            j = next(points_j)

            pcore_i = p_tags_core[i]
            pcore_j = p_tags_core[j]

            l_core  = model.add_line(pcore_i, pcore_j)
            l_chord = model.add_line(tags_inner_points[i], pcore_i)

            l_tags_core.append(l_core)
            l_tags_chords.append(l_chord)

            nn = int(1 + model.get_length(l_chord) // self._d1)

            model.synchronize()

            if structured:
                model.set_transfinite_curve(l_core,  self._n_angular)

            model.set_transfinite_curve(l_chord, nn)

        ###
        # Iteration 2: create the 2D elements
        ###

        points_i = itertools.cycle(range(self._n))
        points_j = itertools.cycle(range(self._n))
        next(points_j)  # j starts one step ahead of i

        surf_tags = []

        for _ in range(self._n):
            i = next(points_i)
            j = next(points_j)

            loop = [
                l_tags_core[i],
                -l_tags_chords[i],
                -tags_inner_lines[i],
                l_tags_chords[j],
            ]
            loop_tag = model.add_curve_loop(loop)
            surf_tag = model.add_plane_surface([loop_tag])
            surf_tags.append(surf_tag)

            model.synchronize()

            if structured:
                model.set_transfinite_surface(surf_tag)

            model.set_recombine(2, surf_tag)

        loop_tag = model.add_curve_loop(l_tags_core)
        surf_tag = model.add_plane_surface([loop_tag])
        surf_tags.append(surf_tag)

        model.synchronize()
        # return surf_tag


def points_on_circle(
        radius: float,
        num_points: int,
        origin: tuple[float, float, float] | None = None,
        rotation: float | None = None,
    ) -> list[tuple[float, float, float]]:
    """ Generate points evenly spaced on a circle in the XY plane. """
    if origin is None:
        origin = (0, 0, 0)

    if rotation is None:
        rotation = 0.0

    rotation = np.deg2rad(rotation)
    (xc, yc, zc) = np.array(origin, dtype=np.float64)
    points = []

    for i in range(num_points):
        angle = i * 2 * np.pi / num_points + rotation
        x = xc + radius * np.cos(angle)
        y = yc + radius * np.sin(angle)
        points.append((x, y, zc))

    return points


def hexagon_points_xy(
        apothem: float,
        origin: tuple[float, float, float] | None = None,
        rotation: float | None = None
    ) -> list[tuple[float, float, float]]:
    """ Create the points for constructing a hexagon in the XY plane.

    Parameters
    ----------
    apothem : float
        Distance from the hexagon center to any of its walls (the apothem).
    origin : tuple[float, float, float]
        Origin point for the hexagon center, default is (0, 0, 0).
    rotation : float
        Rotation angle in degrees to apply to the hexagon points around
        the Z axis, default is 0 (no rotation).
    """
    return points_on_circle(apothem, 6, origin, rotation)


def square_points_xy(
        side: float,
        origin: tuple[float, float, float] | None = None,
        rotation: float | None = None
    ) -> list[tuple[float, float, float]]:
    """ Create the points for constructing a square in the XY plane.

    Parameters
    ----------
    side : float
        Length of the square's side.
    origin : tuple[float, float, float]
        Origin point for the square center, default is (0, 0, 0).
    rotation : float
        Rotation angle in degrees to apply to the square points around
        the Z axis, default is 0 (no rotation).
    """
    return points_on_circle(side * np.sqrt(2) / 2, 4, origin, rotation)
