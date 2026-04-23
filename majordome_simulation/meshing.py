# -*- coding: utf-8 -*-
from typing import Any, Callable, Self
from xml.parsers.expat import model
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
        self.set_physical_name  = model.setPhysicalName

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
        group = self.add_physical_group(1, tags, tag_id, name)
        # self.set_physical_name(1, group, name)
        return group

    def add_physical_surface(self, *, tags: list[int], name: str,
                             tag_id: int = -1) -> int:
        """ Add a physical surface (2D) group. """
        group = self.add_physical_group(2, tags, tag_id, name)
        # self.set_physical_name(2, group, name)
        return group

    def add_physical_volume(self, *, tags: list[int], name: str,
                            tag_id: int = -1) -> int:
        """ Add a physical volume (3D) group. """
        group = self.add_physical_group(3, tags, tag_id, name)
        # self.set_physical_name(3, group, name)
        return group

    def add_physical_groups(self, *,
                            curves: list[dict[str, Any]] | None = None,
                            surfaces: list[dict[str, Any]] | None = None,
                            volumes: list[dict[str, Any]] | None = None,
                                ) -> None:
        """ Add multiple physical groups from a list of dictionaries. """
        # TODO test for duplicates before interacting with gmsh
        if curves is not None:
            for entry in curves:
                self.add_physical_curve(**entry)

        if surfaces is not None:
            for entry in surfaces:
                self.add_physical_surface(**entry)

        if volumes is not None:
            for entry in volumes:
                self.add_physical_volume(**entry)

        self.synchronize()

    def mesh_and_save(self, filename: str, *, dim: int, **kws) -> None:
        """ Generate mesh and save to file. """
        self.synchronize()
        self.generate_mesh(dim)
        gmsh.write(filename)

    def dump(self, *args):
        """ Dump the mesh to files with given names. """
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

    def coordinates(self, x0: float = 0.0) -> NDArray[np.float64]:
        """ Absolute coordinates of the progression points.

        Parameters
        ----------
        x0 : float
            Coordinate of the first point in the progression.

        Returns
        -------
        NDArray[np.float64]
            Coordinates of the ``n + 1`` points delimiting the ``n``
            segments of the progression.
        """
        indices = np.arange(self.n + 1, dtype=np.float64)

        if abs(1.0 - self.q) < self.tol:
            return x0 + self.d0 * indices

        return x0 + self.d0 * (1.0 - self.q**indices) / (1.0 - self.q)

    @property
    def heights(self) -> NDArray[np.float64]:
        """ Heights of the segments in the progression. """
        x = self.coordinates(x0=0.0)
        return x[1:] - x[:-1]

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


class RingBuilder:
    """ Create a ring-shaped geometry with inner and outer boundaries.

    Parameters
    ----------
    model : GmshOCCModel
        Instance of the GmshOCCModel to build the ring in.
    splits : int
        Number of segments to divide the ring into.
    radius_out : float | None
        Outer radius of the ring. Required if `points_out` is not provided.
    radius_in : float | None
        Inner radius of the ring. Required if `points_in` is not provided.
    points_out : list[int] | None
        List of point tags for the outer boundary. Required if `radius_out`
        is not provided.
    points_in : list[int] | None
        List of point tags for the inner boundary. Required if `radius_in`
        is not provided.
    lines_out : list[int] | None
        List of line tags for the outer boundary. If not provided, lines
        will be created between `points_out`.
    lines_in : list[int] | None
        List of line tags for the inner boundary. If not provided, lines
        will be created between `points_in`.
    origin : tuple[float, float, float]
        Origin point for the ring geometry, default is (0, 0, 0).
    linker_in : Callable | None
        Custom function to create inner boundary lines, with signature
        `linker_in(p1, p2) -> line_tag`.
    linker_out : Callable | None
        Custom function to create outer boundary lines, with signature
        `linker_out(p1, p2) -> line_tag`.
    callback_lines : Callable | None
        Optional callback function called after creating each set of lines,
        with signature `callback_lines(split, i, j, l_cout, l_cin, l_chord)`.
    callback_surfaces : Callable | None
        Optional callback function called after creating each surface, with
        signature `callback_surfaces(split, i, j, s_tag)`.
    close_ring : bool
        Whether to create a surface filling the inner boundary of the ring.
        Default is False.
    """
    __slots__ = (
        "_points_in",
        "_points_out",
        "_lines_out",
        "_lines_in",
        "_lines_chords",
        "_surf_tags",
    )

    def __init__(self,
            model: GmshOCCModel,
            splits: int,
            radius_out: float | None = None,
            radius_in: float | None = None,
            points_out: list[int] | None = None,
            points_in: list[int] | None = None,
            lines_out: list[int] | None = None,
            lines_in: list[int] | None = None,
            origin: tuple[float, float, float] = (0, 0, 0),
            linker_in: Callable | None = None,
            linker_out: Callable | None = None,
            callback_lines: Callable | None = None,
            callback_surfaces: Callable | None = None,
            close_ring: bool = False,
            rotation: float = 0.0
        ):
        #####
        ## Data validation
        #####

        # At least one element of the pair must be provided:
        if not points_in and radius_in is None:
            raise ValueError("Either points_in or radius_in must be provided")
        elif points_in is not None and radius_in is not None:
            raise ValueError("Cannot provide both points_in and radius_in")

        if not points_out and radius_out is None:
            raise ValueError("Either points_out or radius_out must be provided")
        elif points_out is not None and radius_out is not None:
            raise ValueError("Cannot provide both points_out and radius_out")

        #####
        ## Points
        #####

        # If points are not provided, generate them from the radius:
        if points_out is None and radius_out is not None:
            p_cout = points_on_circle(radius_out, splits, origin, rotation)
            points_out = [model.add_point(*pt) for pt in p_cout]

        if points_in is None and radius_in is not None:
            p_cin = points_on_circle(radius_in,  splits, origin, rotation)
            points_in = [model.add_point(*pt) for pt in p_cin]

        # Just a sanity check, should never be true (for linter):
        if points_in is None or points_out is None:
            raise ValueError("Failed to generate points for ring boundaries")

        #####
        ## Curves
        #####

        self._points_out = points_out
        self._points_in  = points_in

        objs = self._make_ring_curves(
            model      = model,
            points_in  = self._points_in,
            points_out = self._points_out,
            lines_in   = lines_in or [],
            lines_out  = lines_out or [],
            linker_in  = linker_in,
            linker_out = linker_out,
            callback   = callback_lines or (lambda *args: None)
        )

        l_tags_out, l_tags_in, l_tags_chords = objs
        self._lines_out    = l_tags_out
        self._lines_in     = l_tags_in
        self._lines_chords = l_tags_chords

        #####
        ## Surfaces
        #####

        self._surf_tags = self._make_ring_surfaces(
            model        = model,
            lines_in     = l_tags_in,
            lines_out    = l_tags_out,
            lines_chords = l_tags_chords,
            callback     = callback_surfaces or (lambda *args: None)
        )

        if close_ring:
            loop = model.add_curve_loop(l_tags_in)
            surf = model.add_plane_surface([loop])
            self._surf_tags.append(surf)

        model.synchronize()

    @property
    def points_in(self) -> list[int]:
        """ Access to the inner boundary points of the ring. """
        return self._points_in

    @property
    def points_out(self) -> list[int]:
        """ Access to the outer boundary points of the ring. """
        return self._points_out

    @property
    def lines_out(self) -> list[int]:
        """ Access to the outer boundary lines of the ring. """
        return self._lines_out

    @property
    def lines_in(self) -> list[int]:
        """ Access to the inner boundary lines of the ring. """
        return self._lines_in

    @property
    def lines_chords(self) -> list[int]:
        """ Access to the chord lines connecting inner and outer boundaries. """
        return self._lines_chords

    @property
    def surface_tags(self) -> list[int]:
        """ Access to all surfaces in the ring. """
        return self._surf_tags

    @staticmethod
    def _make_ring_curves(
            model: GmshOCCModel,
            points_in: list[int],
            points_out: list[int],
            lines_in: list[int] | None = None,
            lines_out: list[int] | None = None,
            linker_in: Callable | None = None,
            linker_out: Callable | None = None,
            **kws
        ) -> tuple[list[int], list[int], list[int]]:
        """ Create ordered curves for ring construction. """
        linker_in  = linker_in  or (lambda p1, p2: model.add_line(p1, p2))
        linker_out = linker_out or (lambda p1, p2: model.add_line(p1, p2))
        callback = kws.get("callback", lambda *args: None)

        if lines_in is None:
            lines_in = []

        if lines_out is None:
            lines_out = []

        create_out = len(lines_out) == 0
        create_in  = len(lines_in)  == 0

        n_splits = len(points_in)
        points_i = itertools.cycle(range(n_splits))
        points_j = itertools.cycle(range(n_splits))
        next(points_j)  # j starts one step ahead of i

        l_tags_out    = lines_out
        l_tags_in     = lines_in
        l_tags_chords = []

        for split in range(n_splits):
            i = next(points_i)
            j = next(points_j)

            pcout_i = points_out[i]
            pcout_j = points_out[j]

            pcin_i  = points_in[i]
            pcin_j  = points_in[j]

            if create_out:
                l_cout = linker_out(pcout_i, pcout_j)
                l_tags_out.append(l_cout)
            else:
                l_cout = lines_out[i-1]

            if create_in:
                l_cin = linker_in(pcin_i, pcin_j)
                l_tags_in.append(l_cin)
            else:
                l_cin = lines_in[i-1]

            l_chord = model.add_line(pcout_i, pcin_i)
            l_tags_chords.append(l_chord)

            model.synchronize()
            callback(split, i, j, l_cout, l_cin, l_chord)

        model.synchronize()
        return l_tags_out, l_tags_in, l_tags_chords

    @staticmethod
    def _make_ring_surfaces(
            model: GmshOCCModel,
            lines_in: list[int],
            lines_out: list[int],
            lines_chords: list[int],
            **kws
        ) -> list[int]:
        """  Create surfaces from ordered curves for ring construction. """
        callback = kws.get("callback", lambda *args: None)

        n_splits = len(lines_in)
        points_i = itertools.cycle(range(n_splits))
        points_j = itertools.cycle(range(n_splits))
        next(points_j)  # j starts one step ahead of i

        surf_tags = []

        for split in range(n_splits):
            i = next(points_i)
            j = next(points_j)

            loop = [
                lines_chords[i],
                lines_out[i],
                -lines_chords[j],
                -lines_in[i]
            ]

            loop_tag = model.add_curve_loop(loop)
            surf_tag = model.add_plane_surface([loop_tag])
            surf_tags.append(surf_tag)

            model.synchronize()
            callback(split, i, j, surf_tag)

        model.synchronize()
        return surf_tags

    @staticmethod
    def get_progression_callbacks(
            model: GmshOCCModel,
            num_pts: int,
            bl: float,
            d0: float,
            d1: float
        ) -> tuple[Callable, Callable]:
        """ Get line and surface callback functions for ring meshing. """
        nn, q = GeometricProgression.fit(bl, d0, d1)

        def callback_lines(_split, i, j, l_cout, l_cin, l_chord):
            model.set_transfinite_curve(l_cout, num_pts)
            model.set_transfinite_curve(l_cin,  num_pts)
            model.set_transfinite_curve(l_chord, nn, "Progression", q)

        def callback_surfaces(_split, i, j, surf_tag):
            model.set_transfinite_surface(surf_tag)
            model.set_recombine(2, surf_tag)

        return callback_lines, callback_surfaces


class CircularCrossSection:
    """ Circular cross-section with optional square inner region.

    Parameters
    ----------
    model : GmshOCCModel
        Instance of the GmshOCCModel to build the geometry in.
    radius : float
        Outer radius of the circular cross-section.
    boundary_thickness : float
        Thickness of the boundary layer, defining the inner radius as
        `radius - boundary_thickness`.
    cell_size_external : float
        Target cell size for the external boundary layer region.
    cell_size_internal : float
        Target cell size for the internal central region of the cross-section.
    num_points_angular : int | None
        Number of points to place along the inner and outer circular
        boundaries. If None, it is computed based on the inner radius
        and `cell_size_center`.
    origin : tuple[float, float, float] | None
        Origin point for the cross-section geometry, default is (0, 0, 0).
    num_splits : int
        Number of segments to divide the ring into, default is 8.
    radius_fraction : float
        Fraction of the inner radius to use for the polygonal core region
        when `core_polygonal` is True, default is 0.3.
    core_polygonal : bool
        Whether to create a polygonal core region inside the ring; if
        True, then the following `core_unstructured` option is used to
        tell whether the core region should be closed with a single surface or left open for user-defined meshing. Default is False.
    core_unstructured : bool
        Whether to create an unstructured core region inside the ring.
        Default is False.
    rotation : float
        Rotation angle in radians to apply to the entire geometry.
        Default is 0.0.
    """
    __slots__ = (
        "_model",
        "_r_out",
        "_r_in",
        "_origin",
        "_p_origin",
        "_d0",
        "_d1",
        "_n_splits",
        "_n_angular",
        "_ring",
        "_surfaces",
        "_ring_core",
    )

    def __init__(self,
            model: GmshOCCModel,
            radius: float,
            boundary_thickness: float,
            cell_size_external: float,
            cell_size_internal: float,
            num_points_angular: int | None = None,
            origin: tuple[float, float, float] | None = None,
            num_splits: int = 8,
            radius_fraction: float = 0.3,
            core_polygonal: bool = False,
            core_unstructured: bool = False,
            rotation: float = 0.0,
            recombine: bool = False
        ) -> None:
        #####
        ## Validation and preparation
        #####

        if core_polygonal and core_unstructured:
            raise ValueError("Cannot have both core_polygonal and "
                             "core_unstructured set to True")

        if num_splits < 3:
            raise ValueError("num_splits must be >= 3")

        if origin is None:
            origin = (0, 0, 0)

        self._model = model
        self._r_out  = radius
        self._r_in   = radius - boundary_thickness

        self._origin = origin
        self._p_origin = self._model.add_point(*self._origin)

        self._d0 = cell_size_external
        self._d1 = cell_size_internal

        if num_points_angular is None:
            num_points_angular = int(self._r_in // self._d1)

        self._n_splits = num_splits
        self._n_angular = num_points_angular

        #####
        ## Main boundary ring
        #####

        bl = self._r_out - self._r_in
        nn, q = GeometricProgression.fit(bl, self._d0, self._d1)

        def callback_lines(_split, i, j, l_cout, l_cin, l_chord):
            self._model.set_transfinite_curve(l_cout, self._n_angular)
            self._model.set_transfinite_curve(l_cin,  self._n_angular)
            self._model.set_transfinite_curve(l_chord, nn, "Progression", q)

        def callback_surfaces(_split, i, j, surf_tag):
            self._model.set_transfinite_surface(surf_tag)
            self._model.set_recombine(2, surf_tag)

        self._ring = RingBuilder(
            model             = self._model,
            splits            = self._n_splits,
            radius_out        = self._r_out,
            radius_in         = self._r_in,
            linker_in         = self._add_arc,
            linker_out        = self._add_arc,
            origin            = self._origin,
            callback_lines    = callback_lines,
            callback_surfaces = callback_surfaces,
            rotation          = rotation
        )

        self._surfaces = self._ring.surface_tags.copy()

        #####
        ## Curves
        #####

        self._ring_core = None

        if core_polygonal:
            closed = core_unstructured
            self._create_polygonal_core(self._ring, radius_fraction,
                                        rotation, recombine, closed)

        if core_unstructured:
            self._create_simple_core(self._ring, recombine)

    def _add_arc(self, p_start, p_end):
        """ Add arc around common system origin. """
        return self._model.add_circle_arc(p_start, self._p_origin, p_end)

    def _create_simple_core(self, outer_ring: RingBuilder, recombine: bool):
        """ Simply close the inner core of the ring. """
        loop_tag = self._model.add_curve_loop(outer_ring.lines_in)
        surf_tag = self._model.add_plane_surface([loop_tag])

        self._model.synchronize()

        if recombine:
            self._model.set_recombine(2, surf_tag)

        self._surfaces.append(surf_tag)

        # WIP: could not get this working easily! Dunno!
        # len_arc = 2 * np.pi * self._r_in / self._n
        # len_step = len_arc / self._n_angular
        #
        # size_min = len_step / 2.0
        # size_max = self._r_in
        #
        # def radius(x, y):
        #     dx = x - self._origin[0]
        #     dy = y - self._origin[1]
        #     return np.sqrt(dx**2 + dy**2)
        #
        # def meshSizeCallback(dim, tag, x, y, z, lc):
        #     r = radius(x, y)
        #     f = np.exp(-3.0 * r / self._r_in)
        #     f = size_min + f * (size_max - size_min)
        #     print(f"@ x, y = {x:+.3f}, {y:+.3f} | r = {r:.3f} | f = {f:.3e}")
        #     return min(lc, f)
        #
        # self._model._mesh.setSizeCallback(meshSizeCallback)
        # self._model.synchronize()

    def _create_polygonal_core(self, outer_ring: RingBuilder,
                               radius_fraction: float,
                               rotation: float,
                               recombine: bool,
                               closed: bool):
        """ Create a polygonal core region inside the ring. """
        structured = True

        r_core = self._r_in * radius_fraction
        p_core = points_on_circle(r_core, self._n_splits, self._origin,
                                  rotation)
        p_tags_core = [self._model.add_point(*pt) for pt in p_core]

        def callback_lines(_split, i, j, l_cout, l_core, l_chord):
            nn = int(1 + self._model.get_length(l_chord) // self._d1)
            self._model.set_transfinite_curve(l_chord, nn)

            if structured:
                self._model.set_transfinite_curve(l_core,  self._n_angular)

        def callback_surfaces(split, i, j, surf_tag):
            if structured:
                self._model.set_transfinite_surface(surf_tag)

            self._model.set_recombine(2, surf_tag)

        self._ring_core = RingBuilder(
            model             = self._model,
            splits            = self._n_splits,
            points_in         = p_tags_core,
            points_out        = outer_ring.points_in,
            lines_in          = [],
            lines_out         = outer_ring.lines_in,
            linker_in         = self._add_arc,
            linker_out        = self._add_arc,
            callback_lines    = callback_lines,
            callback_surfaces = callback_surfaces,
            close_ring        = closed
        )

        self._surfaces.extend(self._ring_core.surface_tags)

        surf_tag = self._ring_core.surface_tags[-1]
        # TODO handle structured here with a distance field for the
        # core as it does not need to be so fine as around!

        if recombine:
            self._model.set_recombine(2, surf_tag)

    @property
    def surfaces(self) -> list[int]:
        """ Access to all surface tags in the cross-section.

        Where the first `num_splits` surfaces correspond to the ring
        segments; If a polygonal core is created, the following `num_splits`
        surfaces correspond to the structured core segments; in all cases,
        the last surface corresponds to the unstructured core.
        """
        return self._surfaces

    @property
    def core(self) -> RingBuilder | None:
        """ Access to the inner core ring geometry, if created. """
        return self._ring_core

    @property
    def ring(self) -> RingBuilder:
        """ Access to the main ring geometry of the cross-section. """
        return self._ring


def points_on_circle(
        radius: float,
        num_points: int,
        origin: tuple[float, float, float] = (0, 0, 0),
        rotation: float = 0.0,
    ) -> list[tuple[float, float, float]]:
    """ Generate points evenly spaced on a circle in the XY plane. """
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
        origin: tuple[float, float, float] = (0, 0, 0),
        rotation: float = 0.0,
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
    radius = 2.0 * apothem / np.sqrt(3)
    return points_on_circle(radius, 6, origin, rotation)


def square_points_xy(
        side: float,
        origin: tuple[float, float, float] = (0, 0, 0),
        rotation: float = 0.0,
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


def get_extrusion_tags(new_tags: list[tuple[int, int]], source_dim: int
                       ) -> tuple[list[int], list[int]]:
    """ Extract tags of extruded entities from the list of new tags. """
    extruded_ndim = []
    extruded_super = []
    extruded_sides = []

    this_iter = iter(new_tags[:])
    that_iter = iter(new_tags[1:])

    while True:
        try:
            (this_dim, this_val) = next(this_iter)
            (that_dim, that_val) = next(that_iter)

            if this_dim == source_dim + 1:
                # *this* not handled here, but just skip to the next pair:
                continue

            if this_dim == source_dim and that_dim == source_dim + 1:
                extruded_ndim.append(this_val)
                extruded_super.append(that_val)
                continue

            # TODO validate!
            # extruded_sides.append(this_val)
        except StopIteration:
            break

    return extruded_super, extruded_ndim
