# -*- coding: utf-8 -*-

import re

from pathlib import Path
from typing import Any, Self

from .._core import foam as _ext


FIELD_NAMES = {
    # Common:
    "U",
    "p",
    "T",

    # Turbulence:
    "k",
    "omega",
    "epsilon",
    "alphat",
    "nut",

    # Radiation:
    "G",
}


class FoamDictFile:
    """ Base container class for manipulating OpenFOAM dictionary files.

    Parameters
    ----------
    inner : Any | None = None
        Underlying Rust PyO3 FoamDict instance.
    path : str | Path | None = None
        Associated file path location on disk.
    """

    __slots__ = ("_inner", "_path")

    def __init__(
            self,
            inner: Any | None = None,
            path: str | Path | None = None,
        ) -> None:
        self._inner = inner if inner is not None else _ext.FoamDict()
        self._path: Path | None = (
            Path(path).resolve() if path is not None else None
        )

    @classmethod
    def from_file(cls, path: str | Path) -> Self:
        """ Load and parse OpenFOAM dictionary from file.

        Parameters
        ----------
        path : str | Path
            Target dictionary file path.

        Returns
        -------
        Self
            Parsed dictionary instance.
        """
        path_str = str(path) if isinstance(path, Path) else path
        inner = _ext.FoamDict.from_file(path_str)
        return cls(inner, path=path_str)

    @classmethod
    def from_string(cls, content: str) -> Self:
        """ Parse OpenFOAM dictionary from string content.

        Parameters
        ----------
        content : str
            Raw OpenFOAM text contents.

        Returns
        -------
        Self
            Parsed dictionary instance.
        """
        inner = _ext.FoamDict.parse(content)
        return cls(inner)

    parse = from_string

    @property
    def path(self) -> Path | None:
        """ Get file path on disk if associated with a file. """
        return self._path

    @property
    def header(self) -> dict[str, str]:
        """ Get FoamFile header entries dictionary. """
        if self._inner.contains("FoamFile"):
            val = self._inner.get("FoamFile")

            if isinstance(val, _ext.FoamDict):
                return {k: str(val[k]).strip('"\'') for k in val.keys()}

            if isinstance(val, dict):
                return {k: str(v).strip('"\'') for k, v in val.items()}

        return {}

    @property
    def foam_class(self) -> str | None:
        """ Get OpenFOAM class from FoamFile header. """
        return self.header.get("class")

    @property
    def location(self) -> str | None:
        """ Get OpenFOAM location from FoamFile header. """
        return self.header.get("location")

    @property
    def object(self) -> str | None:
        """ Get OpenFOAM object name from FoamFile header. """
        return self.header.get("object")

    @property
    def format(self) -> str | None:
        """ Get OpenFOAM format setting from FoamFile header. """
        return self.header.get("format")

    def to_foam(self) -> str:
        """ Serialize dictionary to canonical OpenFOAM string format.

        Returns
        -------
        str
            OpenFOAM formatted string representation.
        """
        return self._inner.to_foam()

    def save(self, path: str | Path | None = None) -> None:
        """ Save OpenFOAM dictionary to disk.

        Parameters
        ----------
        path : str | Path | None = None
            Output path location.

        Returns
        -------
        None
            File is written to disk.
        """
        if path is not None:
            path_str = str(path) if isinstance(path, Path) else path
            self._path = Path(path_str).resolve()
            self._inner.save(path_str)

        elif self._path is not None:
            self._inner.save(str(self._path))

        else:
            raise ValueError("No path specified for saving dictionary.")

    def get(self, key_path: str, default: Any = None) -> Any:
        """ Get entry value by slash-separated key path.

        Parameters
        ----------
        key_path : str
            Slash-separated key location (e.g. "solvers/p/tolerance").
        default : Any = None
            Fallback value if key is not found.

        Returns
        -------
        Any
            Entry value or default.
        """
        if (val := self._inner.get(key_path)) is None:
            # TODO handle the case where default is a FoamDict; if not
            # interpret value as string and parse it. This function
            # should always return a reliable/valid input.
            if default is not None:
                return default
            else:
                return _ext.FoamDict()

        return val

    def set(self, key_path: str, value: Any, fmt: Any = None) -> None:
        """ Set entry value by slash-separated key path.

        Parameters
        ----------
        key_path : str
            Slash-separated key location.
        value : Any
            Value to assign.
        fmt : Any
            String formatter for the value.

        Returns
        -------
        None
            Updates internal AST structure.
        """
        if fmt is not None:
            value = fmt.format(value)

        self._inner.set(key_path, value)

    def set_constant(
            self,
            key_path: str,
            value: Any,
            fmt: Any = None
        ) -> None:
        """ Set entry value to a constant value in OpenFOAM format.

        Parameters
        ----------
        key_path : str
            Slash-separated key location.
        value : Any
            Value to assign.
        fmt : Any = None
            Format string for the value.

        Returns
        -------
        None
            Updates internal AST structure.
        """
        if not fmt:
            self.set(key_path, f"constant {value}")
        else:
            self.set(key_path, f"constant {fmt.format(value)}")

    def set_uniform(
            self,
            key_path: str,
            value: Any,
            fmt: Any = None
        ) -> None:
        """ Set entry value to a uniform value in OpenFOAM format.

        Parameters
        ----------
        key_path : str
            Slash-separated key location.
        value : Any
            Value to assign.
        fmt : Any = None
            Format string for the value.

        Returns
        -------
        None
            Updates internal AST structure.
        """
        if not fmt:
            self.set(key_path, f"uniform {value}")
        else:
            self.set(key_path, f"uniform {fmt.format(value)}")

    def delete(self, key_path: str) -> bool:
        """ Remove entry or block by slash-separated key path.

        Parameters
        ----------
        key_path : str
            Slash-separated key location to remove.

        Returns
        -------
        bool
            True if key was found and removed.
        """
        return self._inner.delete(key_path)

    def contains(self, key_path: str) -> bool:
        """ Check if key path exists in dictionary.

        Parameters
        ----------
        key_path : str
            Slash-separated key location.

        Returns
        -------
        bool
            True if path exists.
        """
        return self._inner.contains(key_path)

    def add_include(self, filename: str) -> None:
        """ Add #include directive to top of dictionary.

        Parameters
        ----------
        filename : str
            Include filename or path string.

        Returns
        -------
        None
            Inserts #include directive.
        """
        self._inner.add_include(filename)

    def add_include_etc(self, filename: str) -> None:
        """ Add #includeEtc directive to top of dictionary.

        Parameters
        ----------
        filename : str
            Relative OpenFOAM installation etc path string.

        Returns
        -------
        None
            Inserts #includeEtc directive.
        """
        self._inner.add_include_etc(filename)

    def keys(self) -> list[str]:
        """ Return list of top-level keys in dictionary.

        Returns
        -------
        list[str]
            List of key identifiers.
        """
        return self._inner.keys()

    def __getitem__(self, key: str) -> Any:
        return self._inner[key]

    def __setitem__(self, key: str, value: Any) -> None:
        self._inner[key] = value

    def __contains__(self, key: str) -> bool:
        return key in self._inner


class ControlDict(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM controlDict files. """

    __slots__ = ()

    @property
    def solver(self) -> str | None:
        """ Get simulation solver or application name. """
        return self.get("application") or self.get("solver")

    @solver.setter
    def solver(self, name: str) -> None:
        """ Set simulation solver or application name. """
        self.set("application", name)

    @property
    def application(self) -> str | None:
        """ Get simulation application or solver name. """
        return self.solver

    @application.setter
    def application(self, name: str) -> None:
        """ Set simulation application or solver name. """
        self.solver = name

    @property
    def start_from(self) -> str | None:
        """ Get startFrom mode setting. """
        return self.get("startFrom")

    @start_from.setter
    def start_from(self, value: str) -> None:
        """ Set startFrom mode setting. """
        self.set("startFrom", value)

    @property
    def start_time(self) -> float | int | None:
        """ Get simulation start time. """
        return self.get("startTime")

    @start_time.setter
    def start_time(self, value: float | int) -> None:
        """ Set simulation start time. """
        self.set("startTime", value)

    @property
    def stop_at(self) -> str | None:
        """ Get stopAt mode setting. """
        return self.get("stopAt")

    @stop_at.setter
    def stop_at(self, value: str) -> None:
        """ Set stopAt mode setting. """
        self.set("stopAt", value)

    @property
    def end_time(self) -> float | int | None:
        """ Get simulation end time. """
        return self.get("endTime")

    @end_time.setter
    def end_time(self, value: float | int) -> None:
        """ Set simulation end time. """
        self.set("endTime", value)

    @property
    def delta_t(self) -> float | None:
        """ Get simulation time step deltaT. """
        return self.get("deltaT")

    @delta_t.setter
    def delta_t(self, value: float) -> None:
        """ Set simulation time step deltaT. """
        self.set("deltaT", value)

    @property
    def write_control(self) -> str | None:
        """ Get writeControl mode setting. """
        return self.get("writeControl")

    @write_control.setter
    def write_control(self, value: str) -> None:
        """ Set writeControl mode setting. """
        self.set("writeControl", value)

    @property
    def write_interval(self) -> float | int | None:
        """ Get output writeInterval setting. """
        return self.get("writeInterval")

    @write_interval.setter
    def write_interval(self, value: float | int) -> None:
        """ Set output writeInterval setting. """
        self.set("writeInterval", value)

    @property
    def purge_write(self) -> int | None:
        """ Get purgeWrite count setting. """
        return self.get("purgeWrite")

    @purge_write.setter
    def purge_write(self, value: int) -> None:
        """ Set purgeWrite count setting. """
        self.set("purgeWrite", value)

    @property
    def write_format(self) -> str | None:
        """ Get writeFormat setting (ascii/binary). """
        return self.get("writeFormat")

    @write_format.setter
    def write_format(self, value: str) -> None:
        """ Set writeFormat setting (ascii/binary). """
        self.set("writeFormat", value)

    @property
    def write_precision(self) -> int | None:
        """ Get numerical writePrecision setting. """
        return self.get("writePrecision")

    @write_precision.setter
    def write_precision(self, value: int) -> None:
        """ Set numerical writePrecision setting. """
        self.set("writePrecision", value)

    @property
    def run_time_modifiable(self) -> bool | None:
        """ Get runTimeModifiable boolean flag. """
        return self.get("runTimeModifiable")

    @run_time_modifiable.setter
    def run_time_modifiable(self, value: bool) -> None:
        """ Set runTimeModifiable boolean flag. """
        self.set("runTimeModifiable", value)


class FvSchemes(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM fvSchemes files. """

    __slots__ = ()

    @property
    def ddt_schemes(self) -> Any:
        """ Get time derivative discretization ddtSchemes block. """
        return self.get("ddtSchemes")

    @property
    def grad_schemes(self) -> Any:
        """ Get gradient discretization gradSchemes block. """
        return self.get("gradSchemes")

    @property
    def div_schemes(self) -> Any:
        """ Get divergence discretization divSchemes block. """
        return self.get("divSchemes")

    @property
    def laplacian_schemes(self) -> Any:
        """ Get Laplacian discretization laplacianSchemes block. """
        return self.get("laplacianSchemes")

    @property
    def interpolation_schemes(self) -> Any:
        """ Get interpolationSchemes block. """
        return self.get("interpolationSchemes")

    @property
    def sn_grad_schemes(self) -> Any:
        """ Get surface-normal gradient snGradSchemes block. """
        return self.get("snGradSchemes")

    def set_div_scheme(self, field_name: str, scheme: str) -> None:
        """ Set divergence scheme for a specific field expression.

        Parameters
        ----------
        field_name : str
            Divergence field expression (e.g. "div(phi,U)").
        scheme : str
            Discretization scheme string (e.g. "Gauss limitedLinearV 1").

        Returns
        -------
        None
            Updates divSchemes block entry.
        """
        self.set(f"divSchemes/{field_name}", scheme)


class FvSolution(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM fvSolution files. """

    __slots__ = ()

    @property
    def solvers(self) -> Any:
        """ Get linear equation solvers block. """
        return self.get("solvers")

    @property
    def pimple(self) -> Any:
        """ Get PIMPLE algorithm controls block. """
        return self.get("PIMPLE")

    @property
    def simple(self) -> Any:
        """ Get SIMPLE algorithm controls block. """
        return self.get("SIMPLE")

    @property
    def piso(self) -> Any:
        """ Get PISO algorithm controls block. """
        return self.get("PISO")

    @property
    def relaxation_factors(self) -> Any:
        """ Get equation and field relaxationFactors block. """
        return self.get("relaxationFactors")

    def set_solver(self, var_name: str, config: dict[str, Any]) -> None:
        """ Configure linear solver settings for a variable pattern.

        Parameters
        ----------
        var_name : str
            Variable pattern identifier (e.g. "p" or "(U|k|omega).*").
        config : dict[str, Any]
            Dictionary of linear solver properties (solver, tolerance, etc).

        Returns
        -------
        None
            Updates solvers block.
        """
        for key, val in config.items():
            self.set(f"solvers/{var_name}/{key}", val)

    def set_solver_option(self, var_name: str, option: str, value: Any) -> None:
        """ Set a single solver option for a field variable pattern.

        Parameters
        ----------
        var_name : str
            Variable pattern identifier (e.g. "p").
        option : str
            Option key name (e.g. "tolerance").
        value : Any
            Option value to assign.

        Returns
        -------
        None
            Updates solvers block.
        """
        self.set(f"solvers/{var_name}/{option}", value)


class SnappyHexMeshDict(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM snappyHexMeshDict files. """

    __slots__ = ()

    @property
    def castellated_mesh(self) -> bool | None:
        """ Get castellatedMesh execution flag. """
        return self.get("castellatedMesh")

    @castellated_mesh.setter
    def castellated_mesh(self, value: bool) -> None:
        """ Set castellatedMesh execution flag. """
        self.set("castellatedMesh", value)

    @property
    def snap(self) -> bool | None:
        """ Get snap execution flag. """
        return self.get("snap")

    @snap.setter
    def snap(self, value: bool) -> None:
        """ Set snap execution flag. """
        self.set("snap", value)

    @property
    def add_layers(self) -> bool | None:
        """ Get addLayers execution flag. """
        return self.get("addLayers")

    @add_layers.setter
    def add_layers(self, value: bool) -> None:
        """ Set addLayers execution flag. """
        self.set("addLayers", value)

    @property
    def geometry(self) -> Any:
        """ Get geometry surfaces and regions block. """
        return self.get("geometry")

    @property
    def castellated_mesh_controls(self) -> Any:
        """ Get castellatedMeshControls block. """
        return self.get("castellatedMeshControls")

    @property
    def snap_controls(self) -> Any:
        """ Get snapControls block. """
        return self.get("snapControls")

    @property
    def add_layers_controls(self) -> Any:
        """ Get addLayersControls block. """
        return self.get("addLayersControls")

    @property
    def mesh_quality_controls(self) -> Any:
        """ Get meshQualityControls block. """
        return self.get("meshQualityControls")


class BlockMeshDict(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM blockMeshDict files. """

    __slots__ = ()

    @property
    def scale(self) -> float | int | None:
        """ Get blockMesh length scale factor (convertToMeters). """
        return self.get("convertToMeters") or self.get("scale")

    @scale.setter
    def scale(self, value: float | int) -> None:
        """ Set blockMesh length scale factor (convertToMeters). """
        self.set("convertToMeters", value)

    @property
    def convert_to_meters(self) -> float | int | None:
        """ Get blockMesh length scale factor (convertToMeters). """
        return self.scale

    @convert_to_meters.setter
    def convert_to_meters(self, value: float | int) -> None:
        """ Set blockMesh length scale factor (convertToMeters). """
        self.scale = value

    @property
    def vertices(self) -> Any:
        """ Get blockMesh vertices list. """
        return self.get("vertices")

    @property
    def blocks(self) -> Any:
        """ Get hex blocks topology list. """
        return self.get("blocks")

    @property
    def edges(self) -> Any:
        """ Get curved block edges list. """
        return self.get("edges")

    @property
    def boundary(self) -> Any:
        """ Get blockMesh boundary patches list. """
        return self.get("boundary")


class DecomposeParDict(FoamDictFile):
    """ Strongly-typed interface for OpenFOAM decomposeParDict files. """

    __slots__ = ()

    @property
    def number_of_subdomains(self) -> int | None:
        """ Get numberOfSubdomains core count. """
        return self.get("numberOfSubdomains")

    @number_of_subdomains.setter
    def number_of_subdomains(self, value: int) -> None:
        """ Set numberOfSubdomains core count. """
        self.set("numberOfSubdomains", value)

    @property
    def method(self) -> str | None:
        """ Get domain decomposition method (simple, hierarchical, etc). """
        return self.get("method")

    @method.setter
    def method(self, value: str) -> None:
        """ Set domain decomposition method (simple, hierarchical, etc). """
        self.set("method", value)

    def set_simple_coeffs(self, n_vector: list[int]) -> None:
        """ Set simpleCoeffs sub-domain division vector.

        Parameters
        ----------
        n_vector : list[int]
            Division count per coordinate axis (e.g. [1, 2, 2]).

        Returns
        -------
        None
            Updates simpleCoeffs/n entry.
        """
        self.set("simpleCoeffs/n", n_vector)


class FieldFile(FoamDictFile):
    """ Container for OpenFOAM field files and time-step result files.

    Parameters
    ----------
    inner : Any | None = None
        Underlying Rust PyO3 FoamDict instance.
    data : list[Any] | None = None
        Initial data sequence items.
    path : str | Path | None = None
        Associated file path location on disk.
    """

    __slots__ = ()

    def __init__(
            self,
            inner: Any | None = None,
            data: list[Any] | None = None,
            path: str | Path | None = None,
        ) -> None:
        super().__init__(inner=inner, path=path)

        if data is not None:
            self.extend(data)

    @property
    def dimensions(self) -> list[int] | None:
        """ Get field physical dimensions array [m kg s K mol A cd]. """
        return self.get("dimensions")

    @dimensions.setter
    def dimensions(self, value: list[int]) -> None:
        """ Set field physical dimensions array. """
        self.set("dimensions", value)

    @property
    def internal_field(self) -> Any:
        """ Get internalField values block or uniform value. """
        return self.get("internalField")

    @internal_field.setter
    def internal_field(self, value: Any) -> None:
        """ Set internalField values block or uniform value. """
        self.set("internalField", value)

    @property
    def boundary_field(self) -> Any:
        """ Get boundaryField patches dictionary. """
        return self.get("boundaryField")

    @property
    def data(self) -> list[Any]:
        """ Get underlying field data sequence. """
        if self._inner.has_field_data():
            return self._inner.get_data()

        if (internal := self.internal_field) is not None:
            if isinstance(internal, list):
                return internal

        return self._inner.get_data()

    @data.setter
    def data(self, value: list[Any]) -> None:
        """ Set underlying field data sequence. """
        if self._inner.has_field_data():
            self._inner.set_data(value)

        elif self.contains("internalField"):
            self.internal_field = value

        else:
            self._inner.set_data(value)

    def append(self, value: Any) -> None:
        """ Append single item to field data.

        Parameters
        ----------
        value : Any
            Item to append.

        Returns
        -------
        None
            Appends value to field data.
        """
        self._inner.append_data(value)

    def extend(self, items: list[Any]) -> None:
        """ Extend field data with sequence of items.

        Parameters
        ----------
        items : list[Any]
            Iterable sequence of items.

        Returns
        -------
        None
            Extends field data sequence.
        """
        self._inner.extend_data(items)

    def pop(self, index: int = -1) -> Any:
        """ Pop item from field data by index.

        Parameters
        ----------
        index : int = -1
            Index of item to pop.

        Returns
        -------
        Any
            Removed item.
        """
        return self._inner.pop_data(index)

    def clear(self) -> None:
        """ Clear all field data items.

        Returns
        -------
        None
            Empties field data list.
        """
        self._inner.clear_data()

    def __len__(self) -> int:
        if self._inner.has_field_data():
            return self._inner.data_len()

        if (internal := self.internal_field) is not None:
            if hasattr(internal, "__len__"):
                return len(internal)

        return self._inner.data_len()

    def __getitem__(self, key: int | str | slice) -> Any:
        if isinstance(key, int):
            if self._inner.has_field_data():
                return self._inner.get_data_item(key)

            if (internal := self.internal_field) is not None:
                if hasattr(internal, "__getitem__"):
                    return internal[key]

            return self._inner.get_data_item(key)

        if isinstance(key, slice):
            return self.data[key]

        return super().__getitem__(key)

    def __setitem__(self, key: int | str, value: Any) -> None:
        if isinstance(key, int):
            if self._inner.has_field_data():
                self._inner.set_data_item(key, value)

            elif self.contains("internalField"):
                internal = self.internal_field

                if isinstance(internal, list):
                    internal[key] = value
                    self.internal_field = internal
                else:
                    self._inner.set_data_item(key, value)

            else:
                self._inner.set_data_item(key, value)

        else:
            super().__setitem__(key, value)

    def __iter__(self):
        return iter(self.data)

    def __contains__(self, item: Any) -> bool:
        if isinstance(item, str) and self._inner.contains(item):
            return True

        return item in self.data


class VolScalarField(FieldFile):
    """ Volumetric scalar field initial conditions file. """

    __slots__ = ()


class VolVectorField(FieldFile):
    """ Volumetric vector field initial conditions file. """

    __slots__ = ()


class NotACaseError(ValueError):
    """ Raised when attempting operations on an invalid OpenFOAM case directory. """
    pass


class FoamCaseHandle:
    """ OpenFOAM case directory handle for dynamic case management.

    Parameters
    ----------
    root_dir : str | Path | None = None
        Path to OpenFOAM case root directory. Defaults to current
        working directory.
    zero_name : str = "0"
        Name of the initial conditions directory. Defaults to "0".
    """

    __slots__ = ("_root_dir", "_zero_name", "_cache")

    KNOWN_DICTS: dict[str, tuple[type[FoamDictFile], str]] = {
        "controlDict": (
            ControlDict,
            "system/controlDict"
        ),
        "control_dict": (
            ControlDict,
            "system/controlDict"
        ),
        "fvSchemes": (
            FvSchemes,
            "system/fvSchemes"
        ),
        "fv_schemes": (
            FvSchemes,
            "system/fvSchemes"
        ),
        "fvSolution": (
            FvSolution,
            "system/fvSolution"
        ),
        "fv_solution": (
            FvSolution,
            "system/fvSolution"
        ),
        "blockMeshDict": (
            BlockMeshDict,
            "system/blockMeshDict"
        ),
        "block_mesh_dict": (
            BlockMeshDict,
            "system/blockMeshDict"
        ),
        "snappyHexMeshDict": (
            SnappyHexMeshDict,
            "system/snappyHexMeshDict"
        ),
        "snappy_hex_mesh_dict": (
            SnappyHexMeshDict,
            "system/snappyHexMeshDict"
        ),
        "decomposeParDict": (
            DecomposeParDict,
            "system/decomposeParDict"
        ),
        "decompose_par_dict": (
            DecomposeParDict,
            "system/decomposeParDict"
        ),
    }

    def __init__(
            self,
            root_dir: str | Path | None = None,
            zero_name: str = "0",
        ) -> None:
        if root_dir is None:
            self._root_dir = Path.cwd().resolve()
        else:
            self._root_dir = Path(root_dir).resolve()

        self._zero_name = zero_name
        self._cache: dict[
            str, tuple[Path, FoamDictFile]
        ] = {}

    @property
    def root_dir(self) -> Path:
        """ Get absolute path to the case root directory. """
        return self._root_dir

    @property
    def is_valid(self) -> bool:
        """ Check if root directory is a valid OpenFOAM case. """
        constant_dir = self._root_dir / "constant"
        control_dict = self._root_dir / "system" / "controlDict"
        return constant_dir.is_dir() and control_dict.is_file()

    def check_valid(self) -> None:
        """ Raise NotACaseError if the directory is not a valid OpenFOAM case. """
        if not self.is_valid:
            raise NotACaseError(
                f"Directory '{self._root_dir}' is not a valid OpenFOAM case "
                "(missing 'constant/' directory or 'system/controlDict' file)."
            )

    def _detect_file_class(self, file_path):
        try:
            with open(file_path, "r", encoding="utf-8", errors="replace") as f:
                head = f.read(4096)
        except OSError:
            return None

        foam_class = None
        match = re.search(r"class\s+([A-Za-z0-9_<>]+)\s*;", head)

        if match:
            foam_class = match.group(1)

        match foam_class:
            case (
                "vectorField"
                | "pointField"
                | "scalarField"
                | "labelList"
                | "faceList"
                | "IOPosition"
            ):
                return FieldFile
            case "volScalarField":
                return VolScalarField
            case "volVectorField":
                return VolVectorField
            case "surfaceScalarField":
                return FieldFile
            case "dictionary":
                return FoamDictFile
            case _:
                pass

        if "FoamFile" in head:
            ff_idx = head.find("FoamFile")
            brace_idx = head.find("}", ff_idx)

            if brace_idx != -1:
                remainder = head[brace_idx + 1:].strip()
                lines = [
                    line.strip() for line in remainder.splitlines()
                    if line.strip() and not line.strip().startswith("//")
                ]

                if lines and (
                    lines[0].startswith("(")
                    or re.match(r"^\d+\s*\(", lines[0])
                ):
                    return FieldFile

        return None

    @staticmethod
    def _is_time_dir(path: Path) -> bool:
        name = path.name

        if name in ("0", "0.orig"):
            return True

        try:
            float(name)
            return True
        except ValueError:
            return False

    def _select_cls(
            self,
            file_path: Path,
        ) -> type[FoamDictFile]:
        """ Select the appropriate file wrapper class for a given path.

        Parameters
        ----------
        file_path : Path
            Target file path location.

        Returns
        -------
        type[FoamDictFile]
            Selected wrapper class type.
        """
        filename = file_path.name

        if filename in self.KNOWN_DICTS:
            return self.KNOWN_DICTS[filename][0]

        if (
            self._is_time_dir(file_path.parent)
            or "lagrangian" in file_path.parts
        ):
            return FieldFile

        if filename in FIELD_NAMES:
            return FieldFile

        if file_path.is_file():
            detected = self._detect_file_class(file_path)

            if detected is not None:
                return detected

        return FoamDictFile

    def get_dict(
            self,
            relative_path: str | Path,
        ) -> FoamDictFile:
        """ Load and cache a file by relative path from case root.

        Parameters
        ----------
        relative_path : str | Path
            Relative path to file (e.g. "system/controlDict").

        Returns
        -------
        FoamDictFile
            Loaded dictionary or data field wrapper instance.
        """
        self.check_valid()
        rel_str = str(relative_path)

        if rel_str in self._cache:
            return self._cache[rel_str][1]

        file_path = (self._root_dir / relative_path).resolve()

        for cached_path, cached_obj in self._cache.values():
            if cached_path.resolve() == file_path:
                self._cache[rel_str] = (file_path, cached_obj)
                return cached_obj

        cls = self._select_cls(file_path)

        if file_path.is_file():
            obj = cls.from_file(file_path)
        else:
            obj = cls.from_string("")

        self._cache[rel_str] = (file_path, obj)
        return obj

    get_file = get_dict

    def save(self, *, allow_parent_creation: bool = True) -> None:
        """ Save all cached dictionary modifications back to disk.

        Parameters
        ----------
        allow_parent_creation : bool, default True
            If True, create parent directories if they do not exist.
        """
        for path, obj in self._cache.values():
            if not (parent := Path(path).parent).is_dir():
                if allow_parent_creation:
                    parent.mkdir(parents=True, exist_ok=True)
                else:
                    raise NotADirectoryError(
                        f"Directory '{parent}' does not exist."
                    )

            obj.save(path)

    def __getattr__(self, name: str) -> FoamDictFile:
        if name.startswith("_"):
            raise AttributeError(
                f"'{type(self).__name__}' object has no attribute '{name}'"
            )

        if name in self._cache:
            return self._cache[name][1]

        self.check_valid()

        if name in self.KNOWN_DICTS:
            cls, rel_path_str = self.KNOWN_DICTS[name]
            file_path = (self._root_dir / rel_path_str).resolve()

            if file_path.is_file():
                for cached_path, cached_obj in self._cache.values():
                    if cached_path.resolve() == file_path:
                        self._cache[name] = (file_path, cached_obj)
                        return cached_obj

                obj = cls.from_file(file_path)
                self._cache[name] = (file_path, obj)
                return obj

        candidates = [
            self._root_dir / "system" / name,
            self._root_dir / "constant" / name,
            self._root_dir / self._zero_name / name,
            self._root_dir / name,
        ]

        for file_path in candidates:
            resolved_path = file_path.resolve()

            if resolved_path.is_file():
                for cached_path, cached_obj in self._cache.values():
                    if cached_path.resolve() == resolved_path:
                        self._cache[name] = (resolved_path, cached_obj)
                        return cached_obj

                cls = self._select_cls(resolved_path)
                obj = cls.from_file(resolved_path)
                self._cache[name] = (resolved_path, obj)
                return obj

        # TODO transform this into a warning and create new file.
        raise AttributeError(
            f"No dictionary file matching '{name}' found in "
            f"case at '{self._root_dir}'"
        )

    def __repr__(self) -> str:
        return f"<FoamCaseHandle root='{self._root_dir}' valid={self.is_valid}>"

# TODO add types and create Enums as applicable for the helper classes.

class FoamSearchableSurfaces:
    """ Helper class for the creation of searchable surfaces. """
    @staticmethod
    def sphere(parent, name, center, radius):
        parent.set(f"{name}/type", "sphere")
        parent.set(f"{name}/centre", center)
        parent.set(f"{name}/radius", radius)

    @staticmethod
    def cylinder(parent, name, point1, point2, radius):
        parent.set(f"{name}/type", "cylinder")
        parent.set(f"{name}/point1", point1)
        parent.set(f"{name}/point2", point2)
        parent.set(f"{name}/radius", radius)


class FoamRefinementRegions:
    """ Helper class for the creation of refinement regions. """

    @staticmethod
    def add(
            parent: FoamDictFile | Any,
            name: str,
            mode: str,
            level: int | tuple[Any, ...] | list[Any],
        ) -> None:
        """ Add refinement region specification to dictionary.

        Parameters
        ----------
        parent : FoamDictFile | Any
            Parent dictionary to add region to.
        name : str
            Name of the refinement region surface.
        mode : str
            Refinement mode (e.g. 'inside', 'outside', 'distance').
        level : int | tuple[Any, ...] | list[Any]
            Refinement level or sequence of (distance, level) pairs.

        Returns
        -------
        None
            Sets refinement parameters in parent dictionary.
        """
        parent.set(f"{name}/mode", mode)

        if isinstance(level, int):
            parent.set(f"{name}/level", level)

        elif isinstance(level, (list, tuple)):
            if (
                mode == "distance"
                and len(level) == 2
                and not isinstance(level[0], (list, tuple))
            ):
                level = [level]

            parent.set(f"{name}/levels", level)

        else:
            raise ValueError(f"Cannot set level with {level}")
