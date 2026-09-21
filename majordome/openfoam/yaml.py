# -*- coding: utf-8 -*-
"""
YAML conversion interface for OpenFOAM case directories.

This module provides bidirectional conversion between OpenFOAM case directory
trees and unified YAML representations, as well as the `FoamYamlCase` object
for programmatic case manipulation.
"""

import argparse
import re
import sys
from pathlib import Path
from typing import Any, Self

from ruamel.yaml import YAML

from .._core import foam as _ext
from .files import FoamDictFile


def _foamdict_to_py(obj: Any) -> Any:
    """ Recursively convert a PyO3 `FoamDict` AST object into Python primitives.

    Parameters
    ----------
    obj : Any
        PyO3 `FoamDict` object, dict-like object, list, or primitive value.

    Returns
    -------
    Any
        Nested Python dictionary, list, or primitive type.
    """
    if hasattr(obj, "keys"):
        res: dict[str, Any] = {}
        for key in obj.keys():
            res[key] = _foamdict_to_py(obj.get(key))
        return res
    elif isinstance(obj, list):
        return [_foamdict_to_py(item) for item in obj]
    return obj


def _py_to_foamdict(data: dict[str, Any]) -> FoamDictFile:
    """ Convert a nested Python dictionary back into a `FoamDictFile`.

    Parameters
    ----------
    data : dict[str, Any]
        Nested dictionary containing OpenFOAM keywords and values.

    Returns
    -------
    FoamDictFile
        Populated `FoamDictFile` instance wrapping a PyO3 AST.
    """
    def convert_val(val: Any) -> Any:
        if isinstance(val, dict):
            sub_dict = _ext.FoamDict()
            for sub_k, sub_v in val.items():
                sub_dict[sub_k] = convert_val(sub_v)
            return sub_dict
        return val

    dict_file = FoamDictFile()
    for key, val in data.items():
        dict_file._inner[key] = convert_val(val)
    return dict_file


def _find_case_files(
        case_dir: Path,
        skip_regex: str | None = None,
    ) -> list[Path]:
    """ Discover all eligible OpenFOAM dictionary files in a case directory.

    Skips `polyMesh` directories, included files via `#include`, symlinks,
    and paths matching `skip_regex`.

    Parameters
    ----------
    case_dir : Path
        Absolute path to the OpenFOAM case root directory.
    skip_regex : str | None, optional
        Regex pattern to filter out additional relative file paths.

    Returns
    -------
    list[Path]
        Filtered list of absolute file paths belonging to the case.
    """
    candidate_files: list[Path] = []
    subdirs = ["0.orig", "0", "constant", "system"]
    skip_pattern = re.compile(skip_regex) if skip_regex else None

    for sub in subdirs:
        sub_path = case_dir / sub
        if not sub_path.is_dir():
            continue
        for path in sub_path.rglob("*"):
            if not path.is_file() or path.is_symlink():
                continue
            rel_path = path.relative_to(case_dir)
            if "polyMesh" in rel_path.parts:
                continue
            if skip_pattern and skip_pattern.search(str(rel_path)):
                continue
            candidate_files.append(path)

    included_files: set[Path] = set()
    candidate_set = set(candidate_files)

    for path in candidate_files:
        try:
            content = path.read_text(encoding="utf-8", errors="replace")
            for line in content.splitlines():
                line_str = line.strip()
                if (
                    line_str.startswith("#include")
                    and not line_str.startswith("#includeEtc")
                    and not line_str.startswith("#includeFunc")
                ):
                    match = re.search(
                        r'#include\s+["<]([^">]+)[">]', line_str
                    )
                    if match:
                        inc_path_str = match.group(1).strip()
                        targets = [
                            (path.parent / inc_path_str).resolve(),
                            (case_dir / inc_path_str).resolve(),
                            (case_dir / "constant" / inc_path_str).resolve(),
                            (case_dir / "system" / inc_path_str).resolve(),
                        ]
                        for target in targets:
                            if target in candidate_set:
                                included_files.add(target)
        except Exception:
            pass

    return [p for p in candidate_files if p not in included_files]


def _write_dict_to_case(
        data: dict[str, Any],
        current_parts: list[str],
        case_dir: Path,
    ) -> None:
    """ Recursively write nested dictionary contents back to OpenFOAM dictionary files.

    Parameters
    ----------
    data : dict[str, Any]
        Dictionary block representing files or subdirectories.
    current_parts : list[str]
        Accumulated path parts relative to case root.
    case_dir : Path
        Root path of destination OpenFOAM case.
    """
    if isinstance(data, dict) and "FoamFile" in data:
        rel_path = Path(*current_parts)
        dest_path = case_dir / rel_path
        dest_path.parent.mkdir(parents=True, exist_ok=True)
        dict_file = _py_to_foamdict(data)
        dict_file.save(dest_path)
    elif isinstance(data, dict):
        for key, val in data.items():
            _write_dict_to_case(val, current_parts + [key], case_dir)


def foam_to_yaml(
        case_dir: str | Path | None = None,
        output_path: str | Path | None = None,
        skip_regex: str | None = None,
    ) -> dict[str, Any]:
    """ Convert an OpenFOAM case directory tree into a nested dictionary and optional YAML file.

    Parameters
    ----------
    case_dir : str | Path | None, optional
        Path to the OpenFOAM case directory. Defaults to current directory.
    output_path : str | Path | None, optional
        Path where the exported YAML file will be saved.
    skip_regex : str | None, optional
        Regex pattern to skip matching files or directories.

    Returns
    -------
    dict[str, Any]
        Nested dictionary representation of the OpenFOAM case.
    """
    is_cli = False
    if len(sys.argv) > 0 and (
        "foam2yaml" in sys.argv[0] or "foam_to_yaml" in sys.argv[0]
    ):
        is_cli = True

    if is_cli and case_dir is None:
        parser = argparse.ArgumentParser(
            description="Convert OpenFOAM case directory to a unified YAML file."
        )
        parser.add_argument(
            "case_dir",
            nargs="?",
            default=".",
            help="Path to OpenFOAM case directory (default: current directory).",
        )
        parser.add_argument(
            "-o",
            "--output",
            default="setup.yaml",
            help="Output YAML filepath (default: setup.yaml).",
        )
        parser.add_argument(
            "--skip",
            default=None,
            help="Regex pattern to skip additional files/directories.",
        )
        args = parser.parse_args()
        case_dir = args.case_dir
        output_path = args.output
        skip_regex = args.skip
    else:
        if case_dir is None:
            case_dir = "."

    case_path = Path(case_dir).resolve()
    final_files = _find_case_files(case_path, skip_regex=skip_regex)

    master_dict: dict[str, Any] = {}
    for path in sorted(final_files):
        rel_parts = path.relative_to(case_path).parts
        try:
            dict_file = FoamDictFile.from_file(path)
            data = _foamdict_to_py(dict_file._inner)
            curr = master_dict
            for part in rel_parts[:-1]:
                curr = curr.setdefault(part, {})
            curr[rel_parts[-1]] = data
        except Exception:
            pass

    if output_path is not None:
        out_file = Path(output_path).resolve()
        out_file.parent.mkdir(parents=True, exist_ok=True)
        yaml = YAML()
        yaml.indent(mapping=2, sequence=4, offset=2)
        with open(out_file, "w", encoding="utf-8") as f:
            yaml.dump(master_dict, f)

    return master_dict


def yaml_to_foam(
        input_source: str | Path | dict[str, Any] | None = None,
        case_dir: str | Path | None = None,
    ) -> None:
    """ Convert a YAML file or nested case dictionary into OpenFOAM case directory files.

    Parameters
    ----------
    input_source : str | Path | dict[str, Any] | None, optional
        Input YAML file path or pre-loaded dictionary. Defaults to 'setup.yaml'.
    case_dir : str | Path | None, optional
        Target OpenFOAM case directory. Defaults to current directory.
    """
    is_cli = False
    if len(sys.argv) > 0 and (
        "yaml2foam" in sys.argv[0] or "yaml_to_foam" in sys.argv[0]
    ):
        is_cli = True

    if is_cli and input_source is None:
        parser = argparse.ArgumentParser(
            description="Recreate OpenFOAM case directory files from a YAML file."
        )
        parser.add_argument(
            "input_yaml",
            nargs="?",
            default="setup.yaml",
            help="Input YAML file path (default: setup.yaml).",
        )
        parser.add_argument(
            "-c",
            "--case-dir",
            default=".",
            help="Output OpenFOAM case directory (default: current directory).",
        )
        args = parser.parse_args()
        input_source = args.input_yaml
        case_dir = args.case_dir
    else:
        if input_source is None:
            input_source = "setup.yaml"
        if case_dir is None:
            case_dir = "."

    case_path = Path(case_dir).resolve()

    if isinstance(input_source, (str, Path)):
        yaml_file = Path(input_source).resolve()
        if not yaml_file.is_file():
            raise FileNotFoundError(f"YAML file '{yaml_file}' not found.")
        yaml = YAML()
        with open(yaml_file, "r", encoding="utf-8") as f:
            data = yaml.load(f)
    elif isinstance(input_source, dict):
        data = input_source
    else:
        raise TypeError("input_source must be a file path or dictionary.")

    _write_dict_to_case(data, [], case_path)


class FoamYamlCase:
    """ A container for managing OpenFOAM case parameters.

    Parameters
    ----------
    data : dict[str, Any] | None, optional
        Nested case dictionary. Defaults to empty dictionary.
    """

    def __init__(self, data: dict[str, Any] | None = None) -> None:
        self.data: dict[str, Any] = data if data is not None else {}

    @classmethod
    def from_yaml(cls, yaml_path: str | Path) -> Self:
        """ Load OpenFOAM case object from a YAML file.

        Parameters
        ----------
        yaml_path : str | Path
            Path to input YAML case file.

        Returns
        -------
        Self
            Instantiated `FoamYamlCase` instance.
        """
        yaml = YAML()
        path = Path(yaml_path).resolve()
        with open(path, "r", encoding="utf-8") as f:
            data = yaml.load(f)
        return cls(data=data)

    @classmethod
    def from_case(
            cls,
            case_dir: str | Path = ".",
            skip_regex: str | None = None,
        ) -> Self:
        """ Load OpenFOAM case object directly from a case directory tree.

        Parameters
        ----------
        case_dir : str | Path, optional
            Path to OpenFOAM case directory. Defaults to '.'.
        skip_regex : str | None, optional
            Regex pattern to skip matching files or directories.

        Returns
        -------
        Self
            Instantiated `FoamYamlCase` instance.
        """
        data = foam_to_yaml(case_dir=case_dir, skip_regex=skip_regex)
        return cls(data=data)

    def to_yaml(self, output_path: str | Path) -> None:
        """ Serialize current case data to a YAML file on disk.

        Parameters
        ----------
        output_path : str | Path
            Destination YAML file path.
        """
        out_file = Path(output_path).resolve()
        out_file.parent.mkdir(parents=True, exist_ok=True)
        yaml = YAML()
        yaml.indent(mapping=2, sequence=4, offset=2)
        with open(out_file, "w", encoding="utf-8") as f:
            yaml.dump(self.data, f)

    def to_case(self, case_dir: str | Path = ".") -> None:
        """ Recreate OpenFOAM case directory structure and dictionary files.

        Parameters
        ----------
        case_dir : str | Path, optional
            Destination case root directory. Defaults to '.'.
        """
        yaml_to_foam(input_source=self.data, case_dir=case_dir)

    def get(
            self,
            key_path: str | list[str] | tuple[str, ...],
            default: Any = None,
        ) -> Any:
        """ Access entry value using a slash-separated string or sequence of keys.

        Parameters
        ----------
        key_path : str | list[str] | tuple[str, ...]
            Key path string (e.g. 'system/controlDict/endTime') or tuple/list.
        default : Any, optional
            Fallback value if key is not found. Defaults to None.

        Returns
        -------
        Any
            Retrieved value or default fallback.
        """
        if isinstance(key_path, (list, tuple)):
            parts = [str(p) for p in key_path]
        else:
            parts = key_path.strip("/").split("/")
        curr = self.data
        for part in parts:
            if isinstance(curr, dict) and part in curr:
                curr = curr[part]
            else:
                return default
        return curr

    def set(
            self,
            key_path: str | list[str] | tuple[str, ...],
            value: Any,
        ) -> None:
        """ Set entry value using a slash-separated string or sequence of keys.

        Parameters
        ----------
        key_path : str | list[str] | tuple[str, ...]
            Key path string (e.g. 'system/controlDict/endTime') or tuple/list.
        value : Any
            Value to assign at the target location.
        """
        if isinstance(key_path, (list, tuple)):
            parts = [str(p) for p in key_path]
        else:
            parts = key_path.strip("/").split("/")
        if not parts:
            return
        curr = self.data
        for part in parts[:-1]:
            if part not in curr or not isinstance(curr[part], dict):
                curr[part] = {}
            curr = curr[part]
        curr[parts[-1]] = value

    def __getitem__(self, key: str) -> Any:
        return self.data[key]

    def __setitem__(self, key: str, value: Any) -> None:
        self.data[key] = value

    def __contains__(self, key: str) -> bool:
        return key in self.data
