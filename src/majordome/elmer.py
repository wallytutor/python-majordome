# -*- coding: utf-8 -*-
from pathlib import Path
from typing import Self
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

        return TimeStepAccumulator(total_time / total_steps, total_steps)


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

        x = df["timestep"].to_numpy()
        y = np.log10(df["change"].to_numpy())

        fig, ax = plot.subplots()
        ax[0].plot(x, y, c="k")
