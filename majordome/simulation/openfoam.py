# -*- coding: utf-8 -*-

import re

from abc import ABC, abstractmethod
from io import StringIO
from pathlib import Path

import pandas as pd
import polars as pl


class AbstractFoamDataLoader(ABC):
    """ Abstract interface for loading multiple postProcessing files.

    Parameters
    ----------
    files : list[Path]
        List of files to load.
    kwargs
        Additional keyword arguments to pass to the loader function.
    """

    __slots__ = ("_df",)

    def __init__(self, files: list[Path], **kwargs) -> None:
        data_frames = [self.loader(file, **kwargs) for file in files]
        self._df = pd.concat(data_frames, ignore_index=True)
        self._df.columns = self.get_header(files[0])

    @property
    def table(self) -> pd.DataFrame:
        """ Provides access to a copy of loaded data. """
        return self._df.copy()

    @abstractmethod
    def get_header(self, fname: str | Path) -> list[str]:
        """ Loads header of data file.

        Parameters
        ----------
        fname : str | Path
            The path to the file.

        Returns
        -------
        list[str]
            The list of header column names.
        """
        raise NotImplementedError

    @abstractmethod
    def loader(self, fname: Path, **kwargs) -> pd.DataFrame:
        """ Loads body of data file.

        Parameters
        ----------
        fname : Path
            The path to the file.
        kwargs
            Additional keyword arguments to pass to the loader function.

        Returns
        -------
        pd.DataFrame
            The parsed data as a pandas DataFrame.
        """
        raise NotImplementedError


class FoamTabularData(AbstractFoamDataLoader):
    """ Class to represent tabular data from OpenFOAM reports. """

    __slots__ = ()

    def get_header(self, fname: str | Path) -> list[str]:
        """ Get the header line for a specific report.

        Parameters
        ----------
        fname : str | Path
            The path to the file.

        Returns
        -------
        list[str]
            The list of header column names.
        """
        last_line = None

        # Read until a line is not a comment:
        with open(fname) as f:
            for line in f:
                if not line.startswith("#"):
                    break

                last_line = line

        if last_line is None:
            raise ValueError(f"No header found in report '{fname}'.")

        last_line = last_line.lstrip("#").replace("\t", ",")
        last_line = re.sub(r"\s+", " ", last_line).strip()
        return [h.strip() for h in last_line.split(",")]

    def loader(self, fname: Path, **kwargs) -> pd.DataFrame:
        """ Load OpenFOAM xy files into a pandas DataFrame.
        Parameters
        ----------
        fname : Path
            The path to the file.
        kwargs
            Additional keyword arguments to pass to the loader function.
            The `backend` can be `polars` (default) or `pandas`.

        Returns
        -------
        pd.DataFrame
            The parsed data as a pandas DataFrame.
        """
        backend = kwargs.pop("backend", "polars")
        return _handle_loader_backend(fname, backend, **kwargs)


class FoamLagrangianTable(AbstractFoamDataLoader):
    """ Class to represent Lagrangian data from OpenFOAM reports. """

    __slots__ = ()

    def get_header(self, fname: str | Path) -> list[str]:
        """ Get the header line for a specific report.

        Parameters
        ----------
        fname : str | Path
            The path to the file.

        Returns
        -------
        list[str]
            The list of header column names.
        """
        with open(fname, "r", encoding="utf-8") as f:
            lines = f.readlines()

        if not lines:
            return []

        header_line = lines[0].strip()

        if header_line.startswith("#"):
            header_line = header_line[1:].strip()

        header_clean = header_line.replace("(", " ").replace(")", " ")
        header_cols = header_clean.split()
        num_cols = 0

        for line in lines[1:]:
            l_strip = line.strip()

            if not l_strip or l_strip.startswith("#"):
                continue

            cleaned = l_strip.replace("(", " ").replace(")", " ")
            num_cols = len(cleaned.split())
            break

        if num_cols == 0:
            return header_cols

        if "Y1..YN" in header_cols:
            idx = header_cols.index("Y1..YN")
            num_ys = num_cols - len(header_cols) + 1
            new_ys = [f"Y{i+1}" for i in range(num_ys)]
            header_cols = header_cols[:idx] + new_ys + header_cols[idx+1:]

        elif len(header_cols) < num_cols:
            for i in range(len(header_cols), num_cols):
                header_cols.append(f"col_{i}")

        elif len(header_cols) > num_cols:
            header_cols = header_cols[:num_cols]

        return header_cols

    def loader(self, fname: Path, **kwargs) -> pd.DataFrame:
        """ Load OpenFOAM Lagrangian files into a pandas DataFrame.

        Parameters
        ----------
        fname : Path
            The path to the file.
        kwargs
            Additional keyword arguments to pass to the loader function.

        Returns
        -------
        pd.DataFrame
            The parsed data as a pandas DataFrame.
        """
        backend = kwargs.pop("backend", "polars")

        with open(fname, "r", encoding="utf-8") as f:
            lines = f.readlines()

        if not lines:
            return pd.DataFrame()

        data_rows = []

        for line in lines[1:]:
            l_strip = line.strip()

            if not l_strip or l_strip.startswith("#"):
                continue

            cleaned = l_strip.replace("(", " ").replace(")", " ")
            data_rows.append("\t".join(cleaned.split()))

        if not data_rows:
            return pd.DataFrame()

        source = StringIO("\n".join(data_rows))
        return _handle_loader_backend(source, backend, **kwargs)


class FoamPostProcessingLoader:
    """ Loading and concatenation of OpenFOAM post-processing reports.

    Parameters
    ----------
    domain : str | None
        The name of the OpenFOAM domain to load reports from. If None,
        it will look for reports in the main `postProcessing` directory.
    """
    __slots__ = ( "_domain_dir", "_reports", "_root", )

    def __init__(self,
            domain: str | None = None,
            root: str | Path | None = None
        ) -> None:
        self._root = self._get_root(root)
        self._domain_dir = self._get_domain(self._root, domain)
        self._reports = self._get_domain_reports()

    @staticmethod
    def _get_root(root):
        if root is not None:
            root = Path(root) / "postProcessing"
        else:
            root = Path("postProcessing")

        if not root.is_dir():
            raise ValueError(f"No such directory '{root}'")

        return root

    @staticmethod
    def _get_domain(root, domain):
        if domain is not None:
            domain_dir = root / domain
        else:
            domain_dir = root

        if not domain_dir.is_dir():
            raise ValueError(f"No such directory '{domain_dir}'")

        return domain_dir

    def _get_domain_reports(self) -> list[str]:
        """ Get a list of available reports for the current domain. """
        return [d.name for d in self._domain_dir.iterdir() if d.is_dir()]

    def _get_report_files(self, report: str) -> list[Path]:
        """ Get a list of files for a specific report. """
        if not (report_dir := self._domain_dir / report).is_dir():
            raise ValueError(f"No such report '{report_dir}'.")

        return [f.resolve() for f in report_dir.rglob('*') if f.is_file()]

    def load_report(self,
            report: str,
            loader: AbstractFoamDataLoader = FoamTabularData,
            **kwargs
        ) -> pd.DataFrame:
        """ Load a specific report into a pandas DataFrame.

        Parameters
        ----------
        report : str
            The name of the report to load, must be one of the available
            reports as returned by `available_reports`.
        loader : FoamDataLoader = FoamTabularData.loader
            A custom loader function that takes a file path and returns
            a DataFrame. By default, it uses `openfoam_tabular_loader`
            which is designed to handle OpenFOAM's xy files. The loader
            function should accept a file path and any additional keyword
            arguments, and return a DataFrame with the data from that file.
        kwargs
            Additional keyword arguments to pass to the loader function.
        """
        if not (files := self._get_report_files(report)):
            raise ValueError(f"No files found for report '{report}'.")

        return loader(files).table

    @property
    def available_reports(self) -> list[str]:
        """ Access to the list of available reports. """
        return self._reports

    @property
    def root_directory(self) -> Path:
        """ Access to the root postProcessing directory. """
        return self._root


def _handle_loader_backend(
        source: str | Path | StringIO,
        backend: str = "polars",
        sep: str = "\t",
        comment: str = "#",
        **kwargs
    ) -> pd.DataFrame:
    """ Common handler of tabular data loading. """
    match backend.lower():
        case "pandas":
            df = pd.read_csv(source, sep=sep, comment=comment,
                             header=None, **kwargs)
        case "polars":
            df = pl.read_csv(source, separator=sep, comment_prefix=comment,
                             has_header= False, **kwargs).to_pandas()
        case _:
            raise ValueError(f"Unsupported backend '{backend}'.")

    return df
