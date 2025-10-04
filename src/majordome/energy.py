# -*- coding: utf-8 -*-
from abc import abstractmethod
from typing import Any
from cantera.composite import Solution

from .common import Constants, AbstractReportable
from .reactor import solution_report


class AbstractEnergySource(AbstractReportable):
    """ Abstract base class for energy sources. """
    __slots__ = ()

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    @property
    @abstractmethod
    def power(self) -> float:
        """ Energy source provided power [W]. """
        pass

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        data = [("Source kind", "", self.__class__.__name__),
                ("Provided power", "kW", self.power / 1000)]
        return data

    def report(self, *args, **kwargs) -> str:
        """ Provides a report of the energy source. """
        kwargs.setdefault("headers", ["Property", "Unit", "Value"])
        return super().report(*args, **kwargs)


class CanteraEnergySource(AbstractEnergySource):
    """ An abstract Cantera based energy source. """
    __slots__ = ("_power", "_source", "_phase")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self._source = args[0]
        self._power  = args[1]

        # XXX if phase is unset, after reading data set
        # it to the actual solution phase name.
        self._phase = kwargs.pop("phase", "")

    # -----------------------------------------------------------------------
    # Internal API
    # -----------------------------------------------------------------------

    def _new_solution(self) -> Solution:
        """ Creates a new Cantera solution object. """
        return Solution(self._source, self._phase)

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    @property
    def power(self) -> float:
        """ Energy source provided power [W]. """
        return self._power

    @property
    def source(self) -> str:
        """ Access to the source object. """
        return self._source

    @property
    def phase(self) -> str:
        """ Access to the phase object. """
        return self._phase

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        data = super().report_data(*args, **kwargs)
        data.extend([("Source", "", self.source),
                      ("Phase", "", self.phase)])
        return data

    # -----------------------------------------------------------------------
    # Extension API
    # -----------------------------------------------------------------------

    @property
    def solution(self) -> Solution:
        """ Provides access to a new Cantera solution object. """
        return self._new_solution()


class GasFlowEnergySource(CanteraEnergySource):
    """ An abstract gas flow energy source. """
    __slots__ = ("_mdot", "_area", "_rho")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self._mdot = kwargs.pop("mass_flow_rate")
        self._area = kwargs.pop("cross_area", 1.0)
        self._rho  = -1.0

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        data = super().report_data(*args, **kwargs)
        data.extend([
            ("Reference area", "m²", self._area),
            ("Mass flow rate", "kg/s", self.mass_flow_rate),
            ("Volume flow rate", "m³/s", self.volume_flow_rate),
            ("Momentum flux", "kg.m/s²", self.momentum_flux),
        ])
        return data

    # -----------------------------------------------------------------------
    # Extension API
    # -----------------------------------------------------------------------

    @property
    def momentum_flux(self) -> float:
        """ Provides access to momentum flux in burner [kg.m/s²]. """
        return self._mdot**2 / (self._area * self._rho)

    @property
    def volume_flow_rate(self) -> float:
        """ Provides access to volume flow rate [m³/s]. """
        return self._mdot / self._rho

    @property
    def mass_flow_rate(self) -> float:
        """ Provides access to mass flow rate [kg/s]. """
        return self._mdot


class HeatedGasEnergySource(GasFlowEnergySource):
    """ Non-reacting heated gas flow energy source. """
    __slots__ = ("_temp_ref", "_pres_ref", "_temp_ops", "_comp_ref")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self._temp_ref = kwargs.pop("temperature_ref", Constants.T_REFERENCE)
        self._pres_ref = kwargs.pop("pressure_ref", Constants.P_NORMAL)
        self._comp_ref = kwargs.pop("Y", {})
        self._compute_operation()

    # -----------------------------------------------------------------------
    # Internal API
    # -----------------------------------------------------------------------

    def _compute_operation(self) -> None:
        """ Computes the operating temperature [K] and density [kg/m³]. """
        sol = self._new_solution()

        self._comp_ref = self._comp_ref if self._comp_ref else sol.Y
        sol.TPY = self._temp_ref, self._pres_ref, self._comp_ref

        h = sol.enthalpy_mass + self._power / self._mdot
        sol.HP = h, self._pres_ref

        self._rho = sol.density
        self._temp_ops = sol.T
        self._phase = sol.name

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        data = super().report_data(*args, **kwargs)
        data.extend([
            ("Reference temperature", "K", self._temp_ref),
            ("Reference pressure", "Pa", self._pres_ref),
            *solution_report(self.solution, **kwargs),
        ])
        return data

    # -----------------------------------------------------------------------
    # From CanteraEnergySource
    # -----------------------------------------------------------------------

    @property
    def solution(self) -> Solution:
        """ Provides access to a new Cantera solution object. """
        sol = self._new_solution()
        sol.TPY = self._temp_ops, self._pres_ref, self._comp_ref
        return sol


class CombustionEnergySource(GasFlowEnergySource):
    """ Combustion based energy source. """
    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
