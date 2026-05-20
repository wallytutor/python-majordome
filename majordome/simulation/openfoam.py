# -*- coding: utf-8 -*-
import re
from pathlib import Path
from typing import Callable

import pandas as pd
import polars as pl


class FoamTabularData:
    """ Class to represent tabular data from OpenFOAM reports. """
    @staticmethod
    def get_header(fname: str | Path) -> list[str]:
        """ Get the header line for a specific report. """
        last_line = None

        # Read until a line is not a comment:
        with open(fname) as f:
            for line in f:
                if not line.startswith("#"):
                    break

                last_line = line

        if last_line is not None:
            last_line = last_line.lstrip("#").replace("\t", ",")
            last_line = re.sub(r"\s+", " ", last_line).strip()
            return [h.strip() for h in last_line.split(",")]

        raise ValueError(f"No header found in report '{fname}'.")

    @staticmethod
    def loader(fname: Path, backend="polars",
                                **kwargs) -> pd.DataFrame:
        """ Load OpenFOAM xy files into a pandas DataFrame. """
        comment = "#"

        if backend == "pandas":
            return pd.read_csv(fname, sep=r"\s+", comment=comment,
                            header=None, **kwargs)
        elif backend == "polars":
            df = pl.read_csv(fname, separator="\t", comment_prefix=comment,
                            has_header=False, **kwargs)
            return df.to_pandas()
        else:
            raise ValueError(f"Unsupported backend '{backend}'.")


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
            loader: Callable[[Path], pd.DataFrame] = FoamTabularData.loader,
            **kwargs
        ) -> pd.DataFrame:
        """ Load a specific report into a pandas DataFrame.

        Parameters
        ----------
        report : str
            The name of the report to load, must be one of the available
            reports as returned by `available_reports`.
        loader : Callable[[Path], pd.DataFrame], optional
            A custom loader function that takes a file path and returns
            a DataFrame. By default, it uses `openfoam_tabular_loader`
            which is designed to handle OpenFOAM's xy files. The loader
            function should accept a file path and any additional keyword
            arguments, and return a DataFrame with the data from that file.
        kwargs
            Additional keyword arguments to pass to the loader function.
        """
        files = self._get_report_files(report)

        if not files:
            raise ValueError(f"No files found for report '{report}'.")

        # Use the provided loader function to load each file
        data_frames = [loader(file, **kwargs) for file in files]
        df = pd.concat(data_frames, ignore_index=True)
        df.columns = FoamTabularData.get_header(files[0])
        return df

    @property
    def available_reports(self) -> list[str]:
        """ Access to the list of available reports. """
        return self._reports

    @property
    def root_directory(self) -> Path:
        """ Access to the root postProcessing directory. """
        return self._root
