# -*- coding: utf-8 -*-
from pathlib import Path
import tempfile
import time
from typing import Any, Callable, Mapping, Union

import majordome.data
import pandas as pd

from ..utilities import MajordomePlot

try:
    from .ct_pfr import PyPFR
except (ImportError, Exception):
    PyPFR = None

TwType = Union[float, Callable[[float], float]]


class CPFR:
    """ Plug-flow reactor solver interface for Cantera PFR models.

    Parameters
    ----------
    mech : str
        Mechanism file path or name.
    phase : str
        Phase name in the mechanism file.
    Di : float
        Reactor inner diameter in meters.
    T0 : float
        Inlet temperature in kelvin.
    p0 : float
        Inlet pressure in pascal.
    X0 : str
        Inlet composition in Cantera format.
    Q0 : float
        Inlet volume flow rate in sccm.
    """

    __slots__ = (
        'mech',
        'phase',
        'Di',
        'T0',
        'p0',
        'X0',
        'Q0',
        'rtol',
        'atol',
        'initstep',
        'maxsteps',
        'htc',
        'tw',
        'data',
    )

    def __init__(
        self,
        mech: str,
        phase: str,
        Di: float,
        T0: float,
        p0: float,
        X0: str,
        Q0: float
    ) -> None:
        self.mech = str(mech)
        self.phase = str(phase)
        self.Di = float(Di)
        self.T0 = float(T0)
        self.p0 = float(p0)
        self.X0 = str(X0)
        self.Q0 = float(Q0)

        self.rtol = 1.0e-06
        self.atol = 1.0e-15
        self.initstep = 1.0e-05
        self.maxsteps = 10000
        self.htc = 0.0
        self.tw: TwType = float(T0)
        self.data: pd.DataFrame | None = None

    def set_tolerances(
        self,
        rtol: float = 1.0e-06,
        atol: float = 1.0e-15
    ) -> None:
        """ Set relative and absolute tolerances.

        Parameters
        ----------
        rtol : float = 1.0e-06
            Relative tolerance.
        atol : float = 1.0e-15
            Absolute tolerance.
        """
        self.rtol = float(rtol)
        self.atol = float(atol)

    def set_steps(
        self,
        initstep: float = 1.0e-05,
        maxsteps: int = 10000
    ) -> None:
        """ Set initial step size and maximum number of steps.

        Parameters
        ----------
        initstep : float = 1.0e-05
            Initial step length in meters.
        maxsteps : int = 10000
            Maximum number of internal solver steps.
        """
        self.initstep = float(initstep)
        self.maxsteps = int(maxsteps)

    def set_wall_conditions(
        self,
        htc: float,
        tw: Union[float, Callable[[float], float], None] = None
    ) -> None:
        """ Set wall heat transfer and wall temperature.

        Parameters
        ----------
        htc : float
            Wall heat transfer coefficient in W/(m^2 K).
        tw : float or callable, optional
            Wall temperature in kelvin (scalar or profile).
        """
        self.htc = float(htc)

        if tw is None:
            self.tw = float(self.T0)
        else:
            self.tw = tw

    def solve(
        self,
        length: float,
        step: Union[float, None] = None,
        saveas: Union[str, Path, None] = None
    ) -> int:
        """ Integrate problem along reactor length.

        Parameters
        ----------
        length : float
            Total reactor length in meters.
        step : float, optional
            Saving step in meters. Defaults to length / 100.
        saveas : str or Path, optional
            Path to output CSV results file.

        Returns
        -------
        int
            Exit status (0 on success).
        """
        if PyPFR is None:
            raise RuntimeError(
                'Cantera PFR C++ extension (ct_pfr) is not compiled. '
                'Please compile majordome.plug_flow on Linux with Cantera.'
            )

        dx = float(length / 100.0) if step is None else float(step)

        pfr = PyPFR(
            rtype='heatwall',
            mech=self.mech,
            phase=self.phase,
            Di=self.Di,
            T0=self.T0,
            p0=self.p0,
            X0=self.X0,
            Q0=self.Q0,
            htc=self.htc,
            Tw=self.tw,
        )

        pfr.set_tolerances(self.rtol, self.atol)
        pfr.set_max_num_steps(self.maxsteps)
        pfr.set_initial_step_size(self.initstep)
        pfr.set_stop_position(length)

        t0 = time.time()
        x = 0.0

        while x < length:
            x = x + min(length - x, dx)
            retcode = pfr.solve(x)

            if retcode != 0:
                return retcode

        if saveas is not None:
            out_path = Path(saveas)
            pfr.write_results(str(out_path))

            try:
                self.data = pd.read_csv(out_path)
            except Exception:
                pass
        else:
            with tempfile.NamedTemporaryFile(
                suffix='.csv', delete=False
            ) as tmp:
                tmp_path = Path(tmp.name)

            pfr.write_results(str(tmp_path))

            try:
                self.data = pd.read_csv(tmp_path)
            finally:
                if tmp_path.exists():
                    tmp_path.unlink()

        return 0

    @MajordomePlot.new(shape=(2, 2), size=(10, 6))
    def plot(
        self,
        species: Mapping[str, str],
        data: pd.DataFrame | None = None,
        saveas: Path | str | None = None,
        dpi: int = 300,
        axes: Mapping[str, str] | None = None,
        *,
        plot: MajordomePlot | None = None,
        **kwargs: Any
    ) -> MajordomePlot:
        """ Plot PFR integration profiles using MajordomePlot.

        Parameters
        ----------
        species : Mapping[str, str]
            Species column names and display labels.
        data : pd.DataFrame | None = None
            Table of reactor solution data. Defaults to self.data.
        saveas : Path | str | None = None
            Destination image file path.
        dpi : int = 300
            Output image resolution.
        axes : Mapping[str, str] | None = None
            Custom axis label mapping.
        plot : MajordomePlot | None = None
            Plot instance injected by MajordomePlot.new decorator.

        Returns
        -------
        MajordomePlot
            Standardized plot instance.
        """
        if (figsize := kwargs.pop("figsize", None)) is not None:
            plot.resize(*figsize)
        elif (size := kwargs.pop("size", None)) is not None:
            plot.resize(*size)

        df = self.data if data is None else data

        if df is None:
            raise ValueError(
                "No solution data available. Run solve() or pass data."
            )

        axes_default = {
            "x": "Position ($\\mathrm{m}$)",
            "T": "Temperature ($\\mathrm{K}$)",
            "rho": "Density ($\\mathrm{kg\\,m^{3}}$)",
            "u": "Velocity ($\\mathrm{m\\,s^{-1}}$)",
            "p": "Pressure ($\\mathrm{Pa}$)",
            "Y": "Mass fraction",
        }
        axis_map = dict(axes_default)

        if axes is not None:
            axis_map.update(axes)

        xaxis = "x"
        uaxis = "u"
        paxis = "p"
        yaxis = "Y"
        taxis = "T" if "T" in df.columns else "rho"

        _, ax = plot.subplots()

        ax[0].plot(df[xaxis], df[taxis])
        ax[0].set_xlabel(axis_map[xaxis])
        ax[0].set_ylabel(axis_map[taxis])

        ax[1].plot(df[xaxis], df[uaxis])
        ax[1].set_xlabel(axis_map[xaxis])
        ax[1].set_ylabel(axis_map[uaxis])

        ax[2].plot(df[xaxis], df[paxis])
        ax[2].set_xlabel(axis_map[xaxis])
        ax[2].set_ylabel(axis_map[paxis])

        for key, spec_label in species.items():
            if key in df.columns:
                ax[3].plot(df[xaxis], df[key], label=spec_label)

        ax[3].set_xlabel(axis_map[xaxis])
        ax[3].set_ylabel(axis_map[yaxis])
        ax[3].legend()

        if saveas is not None:
            plot.savefig(saveas, dpi=dpi)


cPFR = CPFR

__all__ = ["CPFR", "cPFR"]
