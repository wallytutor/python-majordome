# -*- coding: utf-8 -*-
from pathlib import Path
from typing import Self
from numpy.typing import NDArray
import numpy as np
import pandas as pd

from .plotting import MajordomePlot


class TimeStepAccumulator:
    """ Helper for checking cumulative time steps. """
    def __init__(self, time_step: float, num_steps: int):
        self.time_step = time_step
        self.num_steps = num_steps

    @property
    def total_time(self) -> float:
        """ Total time covered by the time steps. """
        return self.time_step * self.num_steps

    def __repr__(self) -> str:
        """ Standard representation of the object. """
        return (f"TimeStepCalculator(total_time={self.total_time})")

    def __add__(self, other: Self) -> Self:
        """ Support addition of two TimeStepAccumulator instances. """
        if not isinstance(other, TimeStepAccumulator):
            return NotImplemented

        total_time = self.total_time + other.total_time
        total_steps = self.num_steps + other.num_steps

        return self.__class__(total_time / total_steps, total_steps)


class ElmerConvergenceData:
    """ Class for handling convergence data from Elmer simulations. """
    __slots__ = ("_data", "_solvers")

    def __init__(self, file_path: str | Path) -> None:
        self._data = self.load_convergence_data(file_path)
        self._solvers = self._data["solver"].unique().tolist()

    @staticmethod
    def load_convergence_data(file_path: str) -> pd.DataFrame:
        """ Load convergence data from a text file.

        Parameters
        ----------
        file_path : str
            Path to the file containing convergence data.

        Returns
        -------
        pd.DataFrame
            DataFrame containing the convergence data.
        """
        if not (file_path := Path(file_path)).is_file():
            raise FileNotFoundError(f"File not found: {file_path}")

        with open(file_path) as f:
            if not (line := f.readline().strip()).startswith("!"):
                raise ValueError("Expected header line starting with '!' "
                                f"- malformed file - got: '{line}'")

        names = line.split()[1:]
        return pd.read_csv(file_path, sep=r"\s+", skiprows=1, names=names)

    @property
    def tracked_solvers(self) -> list[int]:
        """ List of unique solvers tracked in the data. """
        return self._solvers

    def get_solver_data(self, solver_id: int) -> pd.DataFrame:
        """ Get convergence data for a specific solver.

        Parameters
        ----------
        solver_id : int
            The ID of the solver to filter by.

        Returns
        -------
        pd.DataFrame
            DataFrame containing convergence data for the specified solver.
        """
        if solver_id not in self._solvers:
            raise ValueError(f"Solver ID {solver_id} not found in data. "
                             f"Available solvers: {self._solvers}")

        df = self._data[self._data["solver"] == solver_id].copy()
        return df.reset_index(drop=True)

    @MajordomePlot.new(xlabel="Timestep", ylabel="Log10(Residual)")
    def plot_solver_convergence(self, *,
            solver_id: int,
            final_iter: bool = False,
            time_axis: NDArray | None = None,
            plot: MajordomePlot
        ) -> MajordomePlot:
        """ Plot convergence data for a specific solver.

        Parameters
        ----------
        solver_id : int
            The ID of the solver to plot.

        Returns
        -------
        pd.DataFrame
            DataFrame containing convergence data for the specified solver.
        """
        df = self.get_solver_data(solver_id)

        if final_iter:
            df = df.groupby("timestep").last().reset_index()

        if final_iter and time_axis is not None:
            if len(time_axis) != len(df):
                raise ValueError("Length of time_axis must match number "
                                 "of timesteps in the data.")

            df["timestep"] = time_axis

        x = df["timestep"].to_numpy()
        y = np.log10(df["change"].to_numpy())

        fig, ax = plot.subplots()
        ax[0].plot(x, y, c="k")


class ElmerTabularMetadata:
    """ Class to hold metadata from Elmer SaveLine .names file.

    Parameters
    ----------
    filepath : str | Path
        Path to the .names metadata file.
    """
    __slots__ = ["_filepath", "_metadata"]

    def __init__(self, filepath: str | Path):
        self._filepath = filepath
        self._metadata = self._read_metadata()

    def _read_metadata(self) -> dict:
        """ Read all metadata from the .names file. """
        sep = ":"
        metadata = {}
        columns = {}
        reading_columns = False

        columns_headers = [
            # SaveLine
            "Data on different columns",

            # SaveScalars
            "Variables in columns of matrix:",
        ]

        with open(self._filepath) as f:
            for line in f:
                line = line.strip()

                # Parse key-value pairs
                if sep in line and not reading_columns:
                    parts = line.split(sep, 1)
                    key = parts[0].strip()
                    value = parts[1].strip()
                    metadata[key] = value

                # Start reading column definitions
                if line in columns_headers:
                    reading_columns = True
                    continue

                # Parse column definitions
                if reading_columns:
                    if not line:
                        break

                    parts = line.split(sep, 1)
                    if len(parts) == 2:
                        col_idx = int(parts[0].strip())
                        col_name = parts[1].strip()
                        columns[col_idx] = col_name

        if columns:
            metadata["columns"] = columns

        return metadata

    @property
    def metadata(self) -> dict:
        """ Return the metadata as a dictionary. """
        return self._metadata

    @property
    def columns(self) -> dict:
        """ Return the column definitions as a dictionary. """
        return self._metadata.get("columns", {})


class ElmerTabularData:
    """ Class to represent the data of a SaveLine results file.

    Parameters
    ----------
    fname : str | Path
        The path to the data file output of Elmer's SaveLine solver.
    fmeta : str | Path | None, optional
        The path to the associated metadata file. If not provided, the
        class will attempt to find a metadata file in the same directory
        as the data file, with the same name but with a .names extension.
        If still not found, it will look for the metadata file one level
         above the data file directory.

    Raises
    ------
    ValueError
        If no metadata file is provided/found.
    """
    __slots__ = ["_meta", "_data"]

    def __init__(self,
                 fname: str | Path, *,
                 fmeta: str | Path | None = None):
        # Internally we require it to be a Path:
        fname = Path(fname)
        fmeta = Path(fmeta) if fmeta is not None else None

        # No file, no data:
        if not fname.exists():
            raise ValueError(f"Data file {fname} does not exist.")

        # Handle metadata suffix:
        suffix = ".names"
        if fmeta is None and fname.suffix == ".dat":
            suffix = ".dat.names"

        # If no metadata is provided, try to find it in the same dir (this is
        # the case for SaveScalars, which outputs .dat and .dat.names in the
        # same dir or for SaveLine when running in serial):
        if fmeta is None:
            fdir = fname.parent
            fmeta = fdir / fname.with_suffix(suffix).name
            # print(f"Looking for metadata file: {fmeta}")

        # If still no metadata, try to find it one level above (this is the
        # case when running in parallel and results are stored in a subdir):
        if not fmeta.exists():
            fdir = fname.parents[1]
            fmeta = fdir / fname.with_suffix(suffix).name
            # print(f"Looking for metadata file: {fmeta}")

        # No metadata, no data:
        if not fmeta.exists():
            raise ValueError("Metadata file is required.")

        self._meta = ElmerTabularMetadata(fmeta)
        self._data = pd.read_csv(fname, sep=r"\s+", header=None)
        self._data.columns = list(self._meta.columns.values())

    @property
    def metadata(self) -> ElmerTabularMetadata:
        """ Provides access to the metadata of the save line data. """
        return self._meta

    @property
    def data(self) -> pd.DataFrame:
        """ Provides access to the data of the save line. """
        return self._data
