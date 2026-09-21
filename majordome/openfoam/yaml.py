# -*- coding: utf-8 -*-
""" YAML conversion interface for OpenFOAM case directories.

This module provides bidirectional conversion between OpenFOAM case
directory trees and unified YAML representations, CLI entrypoints,
as well as the `FoamYamlCase` object for programmatic manipulation.
"""

import argparse
import re
from pathlib import Path
from typing import Any, Self

from ruamel.yaml import YAML
from ruamel.yaml.comments import CommentedMap

from .._core import foam as _ext
from ..utilities import ColorPrint as _C
from .files import FoamDictFile

OPENFOAM_13_HEADER = """/*--------------------------------*- C++ -*----------------------------------*\\
  =========                 |
  \\\\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\\\    /   O peration     | Website:  https://openfoam.org
    \\\\  /    A nd           | Version:  13
     \\\\/     M anipulation  |
\\*---------------------------------------------------------------------------*/"""

FOAM_DIVIDER = (
    "// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //"
)
FOAM_EOF = (
    "// ************************************************************************* //"
)


def _foamdict_to_py(obj: Any) -> Any:
    """ Recursively convert a PyO3 AST object into Python primitives.

    Parameters
    ----------
    obj : Any
        PyO3 object, dictionary, list, or primitive value.

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


def _extract_directives_with_paths(
        file_path: Path,
    ) -> list[tuple[list[str], str, str]]:
    """ Extract preprocessor directives and dictionary hierarchy paths.

    Parameters
    ----------
    file_path : Path
        Path to candidate OpenFOAM dictionary file.

    Returns
    -------
    list[tuple[list[str], str, str]]
        List of tuples (path_stack, directive_name, directive_value).
    """
    directives: list[tuple[list[str], str, str]] = []

    try:
        content = file_path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return directives

    lines = content.splitlines()
    path_stack: list[str] = []
    in_block_comment = False
    pending_key: str | None = None

    for line in lines:
        line_str = line.strip()

        if in_block_comment:
            if "*/" in line_str:
                in_block_comment = False
            continue

        if line_str.startswith("/*"):
            if "*/" not in line_str:
                in_block_comment = True
            continue

        if line_str.startswith("//") or not line_str:
            continue

        if line_str.startswith("#"):
            match = re.match(
                r"(#(?:includeEtc|includeFunc|include|calc))\s*(.*)",
                line_str,
            )

            if match:
                dir_name = match.group(1)
                dir_val = match.group(2).rstrip(";").strip()

                if (dir_val.startswith('"') and dir_val.endswith('"')) or (
                    dir_val.startswith("<") and dir_val.endswith(">")
                ):
                    dir_val = dir_val[1:-1]

                directives.append((list(path_stack), dir_name, dir_val))
                pending_key = None
                continue

        if "{" in line_str:
            before_brace = line_str.split("{")[0].strip()

            if before_brace:
                key = before_brace.split()[-1]
                path_stack.append(key)
            elif pending_key:
                path_stack.append(pending_key)

            pending_key = None
        else:
            if (
                not line_str.endswith(";")
                and not line_str.endswith("}")
                and not line_str.endswith(")")
            ):
                tokens = line_str.split()

                if len(tokens) == 1 and not tokens[0].startswith(
                    ("#", "//", "/*")
                ):
                    pending_key = tokens[0]
                else:
                    pending_key = None
            else:
                pending_key = None

        if "}" in line_str:
            if path_stack:
                path_stack.pop()
            pending_key = None

    return directives


def _attach_directives(
        data: dict[str, Any],
        directives: list[tuple[list[str], str, str]],
    ) -> None:
    """ Attach extracted directives into nested dictionary representation.

    Parameters
    ----------
    data : dict[str, Any]
        Nested dictionary to mutate.
    directives : list[tuple[list[str], str, str]]
        Extracted directives with dictionary hierarchy paths.
    """
    for path, dir_name, dir_val in directives:
        curr = data
        valid = True

        for p in path:
            if p in curr and isinstance(curr[p], dict):
                curr = curr[p]
            else:
                valid = False
                break

        if valid:
            if dir_name in curr:
                if isinstance(curr[dir_name], list):
                    if dir_val not in curr[dir_name]:
                        curr[dir_name].append(dir_val)
                elif curr[dir_name] != dir_val:
                    curr[dir_name] = [curr[dir_name], dir_val]
            else:
                curr[dir_name] = dir_val


def _format_foam_value(val: Any, indent_level: int = 0) -> str:
    """ Format primitive or compound value into canonical OpenFOAM text.

    Parameters
    ----------
    val : Any
        Value to format.
    indent_level : int, default 0
        Current indentation depth.

    Returns
    -------
    str
        Formatted OpenFOAM value string.
    """
    if isinstance(val, bool):
        return "true" if val else "false"

    if isinstance(val, (int, float)):
        return str(val)

    if isinstance(val, str):
        return val

    if isinstance(val, list):
        if not val:
            return "()"

        if all(isinstance(x, (int, float)) for x in val):
            if len(val) == 7:
                return f"[{' '.join(str(x) for x in val)}]"
            if len(val) == 3:
                return f"({' '.join(str(x) for x in val)})"

        items_str = " ".join(_format_foam_value(x) for x in val)
        return f"({items_str})"

    return str(val)


def _dict_to_foam_str(data: dict[str, Any], indent_level: int = 0) -> str:
    """ Serialize nested dictionary into canonical OpenFOAM file content.

    Parameters
    ----------
    data : dict[str, Any]
        Dictionary representation of OpenFOAM file.
    indent_level : int, default 0
        Indentation nesting level.

    Returns
    -------
    str
        Complete OpenFOAM formatted string.
    """
    pad = "    " * indent_level
    lines: list[str] = []

    if indent_level == 0:
        lines.append(OPENFOAM_13_HEADER)

        if "FoamFile" in data:
            lines.append("FoamFile")
            lines.append("{")
            foam_file = data["FoamFile"]

            if isinstance(foam_file, dict):
                for k, v in foam_file.items():
                    val_str = str(v)
                    lines.append(f"    {k:<12} {val_str};")

            lines.append("}")
            lines.append(FOAM_DIVIDER)
            lines.append("")

    for key, val in data.items():
        if indent_level == 0 and key == "FoamFile":
            continue

        if key.startswith("#"):
            if isinstance(val, list):
                for item in val:
                    item_str = (
                        f'"{item}"'
                        if not str(item).startswith('"')
                        and not str(item).endswith("(")
                        else str(item)
                    )
                    lines.append(f"{pad}{key} {item_str};")
            elif val is None or val == "":
                lines.append(f"{pad}{key};")
            else:
                val_str = (
                    f'"{val}"'
                    if not str(val).startswith('"')
                    and not str(val).endswith("(")
                    else str(val)
                )
                lines.append(f"{pad}{key} {val_str};")

            lines.append("")
            continue

        if key.startswith("$"):
            lines.append(f"{pad}{key};")
            lines.append("")
            continue

        if isinstance(val, dict):
            lines.append(f"{pad}{key}")
            lines.append(f"{pad}{{")
            inner = _dict_to_foam_str(val, indent_level + 1)

            if inner:
                lines.append(inner)

            lines.append(f"{pad}}}")
            lines.append("")
        elif (
            isinstance(val, list)
            and val
            and not all(isinstance(x, (int, float)) for x in val)
        ):
            lines.append(f"{pad}{key}")
            lines.append(f"{pad}(")

            for item in val:
                lines.append(f"{pad}    {_format_foam_value(item)}")

            lines.append(f"{pad});")
            lines.append("")
        else:
            val_str = _format_foam_value(val, indent_level)
            lines.append(f"{pad}{key:<16} {val_str};")
            lines.append("")

    if indent_level == 0:
        lines.append(FOAM_EOF)

    return "\n".join(lines)


def _format_yaml_maps(data: Any, is_root: bool = True) -> Any:
    """ Recursively format dictionaries with blank lines between files.

    Parameters
    ----------
    data : Any
        Nested dictionary or primitive value.
    is_root : bool, default True
        Whether the current mapping represents the root container.

    Returns
    -------
    Any
        `CommentedMap` structure containing newline formatting rules.
    """
    if not isinstance(data, dict):
        return data

    cm = CommentedMap()

    for idx, (k, v) in enumerate(data.items()):
        val = _format_yaml_maps(v, is_root=False)
        cm[k] = val

        if idx > 0 and (isinstance(v, dict) or is_root):
            cm.yaml_set_comment_before_after_key(k, before="\n")

    return cm


def _is_mesh_directory(rel_path: Path) -> bool:
    """ Check if the given relative path belongs to mesh geometry data.

    Parameters
    ----------
    rel_path : Path
        Relative path from the case root directory.

    Returns
    -------
    bool
        True if the path is within a `polyMesh` directory.
    """
    return "polyMesh" in rel_path.parts


def _extract_include_targets(
        file_path: Path,
        case_dir: Path,
    ) -> set[Path]:
    """ Extract resolved file targets referenced via `#include` directives.

    Parameters
    ----------
    file_path : Path
        Absolute path to candidate OpenFOAM file.
    case_dir : Path
        Absolute path to the root of the case directory.

    Returns
    -------
    set[Path]
        Set of resolved candidate target paths referenced by `#include`.
    """
    targets: set[Path] = set()

    try:
        content = file_path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return targets

    for line in content.splitlines():
        line_str = line.strip()

        if (
            line_str.startswith("#include")
            and not line_str.startswith("#includeEtc")
            and not line_str.startswith("#includeFunc")
        ):
            match = re.search(r'#include\s+["<]([^">]+)[">]', line_str)

            if match:
                inc_str = match.group(1).strip()
                candidates = [
                    (file_path.parent / inc_str).resolve(),
                    (case_dir / inc_str).resolve(),
                    (case_dir / "constant" / inc_str).resolve(),
                    (case_dir / "system" / inc_str).resolve(),
                ]

                for cand in candidates:
                    if cand.is_file():
                        targets.add(cand)

    return targets


def _collect_case_candidates(
        case_dir: Path,
        subdirs: list[str],
        skip_pattern: re.Pattern | None = None,
        verbose: bool = True,
    ) -> list[Path]:
    """ Gather candidate OpenFOAM dictionary files from standard subdirectories.

    Parameters
    ----------
    case_dir : Path
        Absolute path to the OpenFOAM case root directory.
    subdirs : list[str]
        List of candidate directory names.
    skip_pattern : re.Pattern | None, default None
        Compiled regular expression to skip paths matching specific patterns.
    verbose : bool, default True
        Whether to output progress logs.

    Returns
    -------
    list[Path]
        List of candidate file paths.
    """
    candidates: list[Path] = []

    for sub in subdirs:
        sub_path = case_dir / sub

        if not sub_path.is_dir():
            continue

        for path in sorted(sub_path.rglob("*")):
            if not path.is_file() or path.is_symlink():
                continue

            rel_path = path.relative_to(case_dir)

            if _is_mesh_directory(rel_path):
                if verbose:
                    _C.yellow(f"  Skipping mesh directory: '{rel_path}'")
                continue

            if skip_pattern and skip_pattern.search(str(rel_path)):
                if verbose:
                    _C.yellow(
                        f"  Skipping path matching regex '{skip_pattern.pattern}': '{rel_path}'"
                    )
                continue

            candidates.append(path)

            if verbose:
                _C.blue(f"  Found dictionary candidate: '{rel_path}'")

    return candidates


def _find_case_files(
        case_dir: Path,
        skip_regex: str | None = None,
        verbose: bool = True,
    ) -> list[Path]:
    """ Discover eligible OpenFOAM dictionary files in a case directory.

    Skips `polyMesh` directories, included files via `#include`, symlinks,
    and paths matching `skip_regex`. Provides colored console feedback.

    Parameters
    ----------
    case_dir : Path
        Absolute path to the OpenFOAM case root directory.
    skip_regex : str | None, default None
        Regex pattern to filter out additional relative file paths.
    verbose : bool, default True
        Whether to output colored progress logs using `ColorPrint`.

    Returns
    -------
    list[Path]
        Filtered list of absolute file paths belonging to the case.
    """
    subdirs = ["0.orig", "0", "constant", "system"]
    skip_pattern = re.compile(skip_regex) if skip_regex else None

    if verbose:
        _C.cyan(f"> Scanning OpenFOAM case directory: '{case_dir}'")

    candidate_files = _collect_case_candidates(
        case_dir,
        subdirs,
        skip_pattern=skip_pattern,
        verbose=verbose,
    )

    candidate_set = set(candidate_files)
    all_included_targets: set[Path] = set()

    for path in candidate_files:
        targets = _extract_include_targets(path, case_dir)
        all_included_targets.update(targets)

    included_files = all_included_targets & candidate_set

    if verbose:
        for inc_file in sorted(included_files):
            _C.yellow(
                f"  Excluding included file (#include): '{inc_file.relative_to(case_dir)}'"
            )

    final_files = [p for p in candidate_files if p not in included_files]

    return sorted(final_files)


def _contains_foam_file(d: Any) -> bool:
    """ Check if dictionary contains a 'FoamFile' header or subdict.

    Parameters
    ----------
    d : Any
        Dictionary or primitive value to check.

    Returns
    -------
    bool
        True if 'FoamFile' exists directly or in any child dictionary.
    """
    if not isinstance(d, dict):
        return False

    if "FoamFile" in d:
        return True

    return any(
        _contains_foam_file(v) for v in d.values() if isinstance(v, dict)
    )


def _write_dict_to_case(
        data: dict[str, Any],
        prefix_parts: list[str],
        case_dir: Path,
        verbose: bool = True,
    ) -> None:
    """ Recursively traverse nested dictionary and write case dictionary files.

    Parameters
    ----------
    data : dict[str, Any]
        Nested case configuration dictionary.
    prefix_parts : list[str]
        List of relative directory segments accumulated so far.
    case_dir : Path
        Root directory of the OpenFOAM case.
    verbose : bool, default True
        Whether to output colored progress messages.
    """
    is_file = False

    if prefix_parts:
        if "FoamFile" in data:
            is_file = True
        elif not any(
            _contains_foam_file(v) for v in data.values() if isinstance(v, dict)
        ):
            is_file = True

    if is_file:
        rel_file = Path(*prefix_parts)
        out_path = case_dir / rel_file
        out_path.parent.mkdir(parents=True, exist_ok=True)
        content_str = _dict_to_foam_str(data)
        out_path.write_text(content_str, encoding="utf-8")

        if verbose:
            _C.green(f"  Serialized dictionary file: '{rel_file}'")

        return

    for key, val in data.items():
        if isinstance(val, dict):
            _write_dict_to_case(
                val,
                prefix_parts + [key],
                case_dir,
                verbose=verbose,
            )


def foam_to_yaml(
        case_dir: str | Path = ".",
        output_path: str | Path | None = None,
        skip_regex: str | None = None,
        verbose: bool = True,
    ) -> dict[str, Any]:
    """ Convert case directory files into a unified dictionary or YAML.

    Parameters
    ----------
    case_dir : str | Path, default '.'
        Path to OpenFOAM case root directory.
    output_path : str | Path | None, default None
        Optional destination filepath to serialize YAML to disk.
    skip_regex : str | None, default None
        Optional regex pattern to skip specific files or directories.
    verbose : bool, default True
        Whether to output colored progress logs.

    Returns
    -------
    dict[str, Any]
        Nested dictionary representing the complete case state.
    """
    case_path = Path(case_dir).resolve()
    target_files = _find_case_files(
        case_path,
        skip_regex=skip_regex,
        verbose=verbose,
    )

    if verbose:
        _C.cyan(
            f"> Selected {len(target_files)} OpenFOAM case dictionary files for conversion."
        )

    master_dict: dict[str, Any] = {}

    for path in target_files:
        rel_parts = path.relative_to(case_path).parts
        rel_str = str(path.relative_to(case_path))

        try:
            dict_file = FoamDictFile.from_file(path)
            data = _foamdict_to_py(dict_file._inner)
            directives = _extract_directives_with_paths(path)
            _attach_directives(data, directives)

            curr = master_dict

            for part in rel_parts[:-1]:
                if part not in curr or not isinstance(curr[part], dict):
                    curr[part] = {}
                curr = curr[part]

            curr[rel_parts[-1]] = data

            if verbose:
                _C.blue(f"  Successfully parsed: '{rel_str}'")

        except Exception as err:
            if verbose:
                _C.red(f"  Failed parsing '{rel_str}': {err}")

    if output_path is not None:
        out_file = Path(output_path).resolve()
        out_file.parent.mkdir(parents=True, exist_ok=True)
        yaml = YAML()
        yaml.indent(mapping=2, sequence=4, offset=2)
        formatted_map = _format_yaml_maps(master_dict)

        with open(out_file, "w", encoding="utf-8") as f:
            yaml.dump(formatted_map, f)

        if verbose:
            size = out_file.stat().st_size
            _C.green(
                f"> Exported OpenFOAM case YAML to '{out_file}' ({size} bytes)"
            )

    return master_dict


def yaml_to_foam(
        input_source: str | Path | dict[str, Any] = "setup.yaml",
        case_dir: str | Path = ".",
        verbose: bool = True,
    ) -> None:
    """ Convert YAML or nested dictionary into OpenFOAM case directory files.

    Parameters
    ----------
    input_source : str | Path | dict[str, Any], default 'setup.yaml'
        Input YAML file path or pre-loaded dictionary.
    case_dir : str | Path, default '.'
        Target OpenFOAM case directory.
    verbose : bool, default True
        Whether to print colored progress logs.
    """
    case_path = Path(case_dir).resolve()

    if verbose:
        _C.cyan(f"> Recreating OpenFOAM case at '{case_path}'")

    if isinstance(input_source, (str, Path)):
        yaml_file = Path(input_source).resolve()

        if not yaml_file.is_file():
            _C.red(f"> Error: YAML file '{yaml_file}' not found.")
            raise FileNotFoundError(f"YAML file '{yaml_file}' not found.")

        yaml = YAML()

        with open(yaml_file, "r", encoding="utf-8") as f:
            data = yaml.load(f)

    elif isinstance(input_source, dict):
        data = input_source

    else:
        _C.red("> Error: input_source must be a file path or dictionary.")
        raise TypeError("input_source must be a file path or dictionary.")

    _write_dict_to_case(data, [], case_path, verbose=verbose)

    if verbose:
        _C.green(
            f"> Synchronized OpenFOAM case files successfully at '{case_path}'."
        )


def _cli_foam_to_yaml() -> None:
    """ CLI entrypoint for converting an OpenFOAM case directory to YAML. """
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

    foam_to_yaml(
        case_dir=args.case_dir,
        output_path=args.output,
        skip_regex=args.skip,
        verbose=True,
    )


def _cli_yaml_to_foam() -> None:
    """ CLI entrypoint for recreating OpenFOAM case directory files from YAML. """
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

    yaml_to_foam(
        input_source=args.input_yaml,
        case_dir=args.case_dir,
        verbose=True,
    )


class FoamYamlCase:
    """ High-level container for managing OpenFOAM cases via YAML structures.

    Parameters
    ----------
    data : dict[str, Any] | None = None
        Nested case dictionary. Defaults to empty dictionary.
    """

    __slots__ = ("_data",)

    def __init__(self, data: dict[str, Any] | None = None) -> None:
        self._data: dict[str, Any] = data if data is not None else {}

    @property
    def data(self) -> dict[str, Any]:
        """ Return underlying case configuration dictionary. """
        return self._data

    @data.setter
    def data(self, value: dict[str, Any]) -> None:
        self._data = value

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
            verbose: bool = True,
        ) -> Self:
        """ Load OpenFOAM case object directly from a case directory tree.

        Parameters
        ----------
        case_dir : str | Path, default '.'
            Path to OpenFOAM case directory.
        skip_regex : str | None, default None
            Regex pattern to skip matching files or directories.
        verbose : bool, default True
            Whether to output colored scanning progress logs.

        Returns
        -------
        Self
            Instantiated `FoamYamlCase` instance.
        """
        data = foam_to_yaml(
            case_dir=case_dir,
            skip_regex=skip_regex,
            verbose=verbose,
        )
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
        formatted_map = _format_yaml_maps(self._data)

        with open(out_file, "w", encoding="utf-8") as f:
            yaml.dump(formatted_map, f)

        _C.green(f"> Saved updated case YAML to '{out_file}'")

    def to_case(self, case_dir: str | Path = ".", verbose: bool = True) -> None:
        """ Recreate OpenFOAM case directory structure and dictionary files.

        Parameters
        ----------
        case_dir : str | Path, default '.'
            Destination case root directory.
        verbose : bool, default True
            Whether to output colored progress logs.
        """
        yaml_to_foam(
            input_source=self._data,
            case_dir=case_dir,
            verbose=verbose,
        )

    def get(
            self,
            key_path: str | list[str] | tuple[str, ...],
            default: Any = None,
        ) -> Any:
        """ Access entry value using a slash-separated string or key sequence.

        Parameters
        ----------
        key_path : str | list[str] | tuple[str, ...]
            Key path string (e.g. 'system/controlDict/endTime') or tuple/list.
        default : Any = None
            Fallback value if key is not found.

        Returns
        -------
        Any
            Retrieved value or default fallback.
        """
        if isinstance(key_path, (list, tuple)):
            parts = [str(p) for p in key_path]
        else:
            parts = key_path.strip("/").split("/")

        curr = self._data

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
        """ Set entry value using a slash-separated string or key sequence.

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

        curr = self._data

        for part in parts[:-1]:
            if part not in curr or not isinstance(curr[part], dict):
                curr[part] = {}

            curr = curr[part]

        curr[parts[-1]] = value

    def __getitem__(self, key: str) -> Any:
        return self._data[key]

    def __setitem__(self, key: str, value: Any) -> None:
        self._data[key] = value

    def __contains__(self, key: str) -> bool:
        return key in self._data
