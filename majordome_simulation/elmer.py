# -*- coding: utf-8 -*-
from dataclasses import dataclass
from pathlib import Path
from typing import Self
from numpy.typing import NDArray
import numpy as np
import pandas as pd

from majordome_utilities.plotting import MajordomePlot


@dataclass
class ConstantTimeStepInterval:
    """ Create a constant time step interval for a simulation.

    Parameters
    ----------
    duration : float
        Total duration of the time step interval.
    time_step : float | None, optional
        Size of each time step. If not provided, it will be calculated
        based on the `duration` and `min_steps` parameters.
    save_interval : float | None, optional
        Interval at which to save results. If not provided, it will be
        set equal to `time_step`.
    min_steps : int, optional
        Minimum number of time steps to use if `time_step` is not provided.
        Must be at least 1. Default is 2.
    """
    intervals: int
    save_every: int
    time_step: float
    duration: float

    def __init__(self, duration: float, time_step: float | None = None,
                 save_interval: float | None = None, *,
                 min_steps: int = 2) -> None:

        if duration <= 0:
            raise ValueError(
                f"Duration must be positive ({duration})")

        if (time_step is None or time_step <= 0) and min_steps < 1:
            raise ValueError(
                f"Minimum steps must be at least 1 ({min_steps})")


        if time_step is None:
            time_step = duration / min_steps

        if save_interval is None:
            save_interval = time_step


        if time_step <= 0:
            raise ValueError(
                f"Time step must be positive ({time_step})")

        if save_interval <= 0:
            raise ValueError(
                f"Save interval must be positive ({save_interval})")

        if time_step > duration:
            raise ValueError(
                f"Time step cannot be greater than duration "
                f"({time_step} > {duration})")

        if save_interval > duration:
            raise ValueError(
                f"Save interval cannot be greater than duration "
                f"({save_interval} > {duration})")

        if save_interval < time_step:
            raise ValueError(
                f"Save interval cannot be smaller than time step "
                f"({save_interval} < {time_step})")


        self.intervals = int(round(duration / time_step))
        self.save_every = int(round(save_interval / time_step))

        self.duration = duration
        self.time_step = duration / self.intervals

    def __repr__(self) -> str:
        return (f"ConstantTimeStep(duration={self.duration}, "
                f"time_step={self.time_step}, "
                f"intervals={self.intervals}, "
                f"save_every={self.save_every})")

    def into_formatted_data(self) -> list[str]:
        """ Format the time step data for output in an Elmer SIF file. """
        return [
            f"{self.duration:>13g}",
            f"{self.time_step:>13.6e}",
            f"{self.intervals:>13d}",
            f"{self.save_every:>13d}",
        ]


class TimeStepAccumulator:
    """ Helper for creating cumulative time steps in Elmer SIF files.

    Parameters
    ----------
    time_steps : ConstantTimeStepInterval
        Variable number of time step intervals to accumulate.
    """
    __slots__ = ("_time_steps",)

    def __init__(self, *time_steps: ConstantTimeStepInterval) -> None:
        self._time_steps = list(time_steps)

    def __repr__(self) -> str:
        """ String representation for debugging. """
        return (f"TimeStepAccumulator(duration={self.duration})")

    def __str__(self) -> str:
        """ String representation formatted for Elmer SIF file. """
        text = f"! >> Total duration: {self.duration:.6g} << !\n"

        for k, row in self.to_dataframe().iterrows():
            text += " ".join(map(str, row)) + "\n"

        return text

    @property
    def duration(self) -> float:
        """ Duration of the accumulated time steps. """
        return sum(ts.duration for ts in self._time_steps)

    def add_block(self, *, duration: float | None = None,
                  end_time: float | None = None,
                  **kws) -> None:
        """ Add a new block of time steps with the given parameters.

        Parameters
        ----------
        duration : float
            Duration of the new time step block. If not provided, then
            `end_time` must be provided.
        end_time : float
            End time of the new time step block. If not provided, then
            `duration` must be provided. If provided, the duration of
            the new block will be calculated as `end_time - self.duration`.
        kws:
            Additional keyword arguments to pass to the
            `ConstantTimeStepInterval` constructor.
        """
        if duration is None and end_time is None:
            raise ValueError("Either provide 'duration' or 'end_time'.")

        if duration is not None and end_time is not None:
            raise ValueError("Provide only 'duration' or 'end_time'.")

        if end_time is not None:
            duration = end_time - self.duration

        if duration is None:
            raise ValueError("Duration could not be determined.")

        self.append(ConstantTimeStepInterval(duration, **kws))

    def append(self, time_step: ConstantTimeStepInterval) -> None:
        """ Append a new time step to the accumulator.

        Parameters
        ----------
        time_step : ConstantTimeStepInterval
            The time step interval to append to the accumulator.
        """
        self._time_steps.append(time_step)

    def to_dataframe(self) -> pd.DataFrame:
        """ Convert the accumulated time steps into a table. """
        headers = ["! Step Duration", "Timestep Sizes",
                   "Timestep Intervals", "Output Intervals"]

        data = [ts.into_formatted_data() for ts in self._time_steps]
        df = pd.DataFrame(data, columns=headers)

        # Format to get aligned equal signs in SIF:
        n = len(data)
        columns = [f"{c}({n})" for c in headers]
        fmt = f"{{:<{1 + max(map(len, columns))}}} ="

        # Transpose for printing in Elmer SIF:
        df = df.T.reset_index()
        df.columns = list(range(len(df.columns)))

        # Labels for Elmer SIF:
        df[0] = [fmt.format(c) for c in columns]

        return df


class ElmerConvergenceData:
    """ Class for handling convergence data from Elmer simulations.

    Parameters
    ----------
    file_path : str | Path
        Path to the file containing convergence data, typically output
        by Elmer's SaveLine solver.
    """
    __slots__ = ("_data", "_solvers")

    def __init__(self, file_path: str | Path) -> None:
        self._data = self.load_convergence_data(file_path)
        self._solvers = self._data["solver"].unique().tolist()

    @staticmethod
    def load_convergence_data(file_path: str | Path) -> pd.DataFrame:
        """ Load convergence data from a text file.

        Parameters
        ----------
        file_path : str | Path
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
            plot: MajordomePlot | None = None,
        ) -> MajordomePlot:
        """ Plot convergence data for a specific solver.

        Parameters
        ----------
        solver_id : int
            The ID of the solver to plot.
        final_iter : bool, optional
            If True, only plot the final iteration for each timestep.
        time_axis : NDArray | None, optional
            Optional array of time values to use as the x-axis. If not provided, the timestep numbers will be used.
        plot : MajordomePlot | None, optional
            Placeholder for plot object provided by decorator.

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


        if plot is None:
            raise ValueError("Plot object must be provided.")

        _, ax = plot.subplots()
        ax[0].plot(x, y, c="k")
        return plot


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
        # XXX idea, if the following line is present in metadata, then
        # use it to find the data file. Maybe write a function that takes
        # the metadata file and finds the data file, instead of the other
        # way around. This would be more robust...
        # Metadata for SaveScalars file:

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
