# -*- coding: utf-8 -*-
from abc import abstractmethod
from functools import wraps, update_wrapper
from typing import Any
from cantera.composite import Solution
import cantera as ct

from .common import CompositionType, Constants, AbstractReportable
from .reactor import solution_report, copy_quantity
from .parsing import FuncArguments


class CombustionAtmosphereCHON:
    """ Combustion atmosphere calculations for CHON system.

    Parameters
    ----------
    mechanism: str
        Kinetics mechanism/database to use in computations.
    basis: str = "mass"
        Basis on which to compute equivalence ratio.
    """
    def __init__(self, mechanism: str, basis: str = "mass") -> None:
        self._solution = ct.Solution(mechanism)
        self._basis = basis

    def _state_standard(self, X):
        """ Set internal solution to standard state / composition. """
        self._solution.TPX = 273.15, ct.one_atm, X

    def _state_premix(self, phi, Y_c, Y_o, basis):
        """ Set internal solution to combustion premix composition. """
        self._solution.set_equivalence_ratio(phi, Y_c, Y_o, basis=basis)

    def _state_initial(self, species, oxidizer):
        """ Before combustion: reference state, stoichiometric. """
        self._solution.TP = 298.15, ct.one_atm
        self._solution.set_equivalence_ratio(1.0, species, oxidizer)
        return self._solution.enthalpy_mass, self._solution[species].Y[0]

    def _state_final(self):
        """ After combustion: complete combustion products. """
        self._solution.TPX = None, None, {
            "CO2": 1.0 * self._solution.elemental_mole_fraction("C"),
            "H2O": 0.5 * self._solution.elemental_mole_fraction("H"),
            "N2":  0.5 * self._solution.elemental_mole_fraction("N")
        }
        return self._solution.enthalpy_mass

    def _species_heating_value(self, species, oxidizer):
        """ Lower heating value of a single species [MJ/kg]. """
        h1, Y_fuel = self._state_initial(species, oxidizer)
        return (self._state_final() - h1) / Y_fuel

    def solution_heating_value(self,
            fuel: CompositionType,
            oxidizer: CompositionType
        ) -> float:
        """ Evaluate lower heating value of mixture.

        Parameters
        ----------
        fuel: CompositionType
            Composition of fuel in species mole fractions.
        oxidizer: CompositionType
            Composition of oxidizer in species mole fractions.

        Returns
        -------
        float
            Lower heating value of provided mixture [MJ/kg].
        """
        self._solution.TPX = None, None, fuel
        Y_fuel = self._solution.mass_fraction_dict()

        hv = sum(Y * self._species_heating_value(species, oxidizer)
                 for species, Y in Y_fuel.items())

        return -1.0e-06 * float(hv)

    def combustion_setup(self,
            power: float,
            phi: float,
            fuel: CompositionType,
            oxidizer: CompositionType,
            species: str = "O2"
        ) -> tuple[float, float, float]:
        """ Evaluates combustion setup for given quantities.

        Parameters
        ----------
        power: float
            Total supplied power [kW]
        phi: float
            Oxidizer-fuel equivalence ratio.
        fuel: CompositionType
            Composition of fuel in species mole fractions.
        oxidizer: CompositionType
            Composition of oxidizer in species mole fractions.
        species: str = "O2"
            Reference species for oxidizer mass balance.
        """
        lhv = self.solution_heating_value(fuel, oxidizer)
        mdot_c = 0.001 * power / lhv

        self._state_standard(fuel)
        Y_c = self._solution.mass_fraction_dict()
        X_c = self._solution.mole_fraction_dict()

        self._state_standard(oxidizer)
        Y_o = self._solution.mass_fraction_dict()
        X_o = self._solution.mole_fraction_dict()

        if self._basis == "mole":
            self._state_premix(phi, X_c, X_o, self._basis)
        else:
            self._state_premix(phi, Y_c, Y_o, self._basis)

        Y_m = self._solution.mass_fraction_dict()

        y_c = Y_c.get(species, 0.0)
        y_o = Y_o.get(species, 0.0)
        y_m = Y_m.get(species, 0.0)

        mdot_t = mdot_c * (y_c - y_o) / (y_m - y_o)
        mdot_o = mdot_t - mdot_c

        return (lhv, mdot_c, mdot_o)

    def normal_density(self, X: CompositionType) -> float:
        """ Compute solution normal density.

        Parameters
        ----------
        X: CompositionType
            Composition of solution in species mole fractions.

        Returns
        -------
        float
            Solution density under standard state [kg/Nm³].
        """
        self._state_standard(X)
        return self._solution.density_mass

    def normal_flow(self, mdot: float, X: CompositionType) -> float:
        """ Computes volume flow rate from mass flow and composition.

        Parameters
        ----------
        mdot: float
            Solution mass flow rate [kg/s].
        X: CompositionType
            Composition of solution in species mole fractions.

        Returns
        -------
        float
            Volume flow rate under standard state [Nm³/h].
        """
        return 3600 * mdot / self.normal_density(X)


def _init_combustion_power_supply(cls):
    """ Decorator to enhance CombustionPowerSupply with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("power", 0)
    parser.add("equivalence", 1)
    parser.add("fuel", 2)
    parser.add("oxidizer", 3)
    parser.add("mechanism", 4)
    parser.add("species", default="O2")
    parser.add("emissions", default=True)
    parser.add("basis", default="mass")

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        power       = parser.get("power")
        equivalence = parser.get("equivalence")
        fuel        = parser.get("fuel")
        oxidizer    = parser.get("oxidizer")
        mechanism   = parser.get("mechanism")
        species     = parser.get("species")
        emissions   = parser.get("emissions")
        basis       = parser.get("basis")
        parser.close()

        self._ca = CombustionAtmosphereCHON(mechanism, basis=basis)
        self._lhv, self._mdot_c, self._mdot_o = self._ca.combustion_setup(
            power, equivalence, fuel, oxidizer, species=species)

        self._power = power
        self._Xc    = fuel
        self._Xo   = oxidizer

        if emissions:
            self._m_h2o, self._m_co2 = self._emissions(mechanism)

        return orig_init(self, *parser.args, **parser.kwargs)

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_combustion_power_supply
class CombustionPowerSupply(AbstractReportable):
    """ Provides combustion calculations for given power supply.

    Parameters
    ----------
    power: float
        Total supplied power [kW]
    equivalence: float
        Oxidizer-fuel equivalence ratio.
    fuel: CompositionType
        Composition of fuel in species mole fractions.
    oxidizer: CompositionType
        Composition of oxidizer in species mole fractions.
    mechanism: str
        Kinetics mechanism/database to use in computations.
    species: str = "O2"
        Reference species for oxidizer mass balance.
    emissions: bool = True
        If true, compute emissions of water and carbon dioxide.
    basis: str = "mass"
        Basis on which to compute equivalence ratio.
    """
    __slots__ = ("_mechanism", "_power", "_lhv", "_mdot_c", "_mdot_o",
                 "_Xc", "_Xo", "_ca", "_m_h2o", "_m_co2",
                 "_rho_c", "_rho_o", "_qdot_c", "_qdot_o")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    def _emissions(self, mechanism, h2o="H2O", co2="CO2"):
        """ Evaluate complete combustion products for a gas. """
        mixer = CombustionAtmosphereMixer(mechanism)
        
        if self._mdot_o > 0.0:
            mixer.add_quantity(self._mdot_o, self._Xo)

        if self._mdot_c > 0.0:
            mixer.add_quantity(self._mdot_c, self._Xc)

        qty = mixer.solution
        qty.TP = 298.15, ct.one_atm
        qty.equilibrate("TP")

        Y = qty.mass_fraction_dict()
        m_1 = qty.mass * Y.get(h2o, 0.0)
        m_2 = qty.mass * Y.get(co2, 0.0)

        return m_1, m_2

    @property
    def power(self) -> float:
        """ Access to combustion power [kW]. """
        return self._power

    @property
    def fuel_mass(self) -> float:
        """ Access to fuel mass flow rate. """
        return self._mdot_c

    @property
    def oxidizer_mass(self) -> float:
        """ Access to oxidizer mass flow rate. """
        return self._mdot_o

    @property
    def fuel_volume(self) -> float:
        """ Access to fuel volume flow rate. """
        if not hasattr(self, "_qdot_c"):
            self._qdot_c = self._ca.normal_flow(self._mdot_c, self._Xc)
        return self._qdot_c

    @property
    def oxidizer_volume(self) -> float:
        """ Access to oxidizer volume flow rate. """
        if not hasattr(self, "_qdot_o"):
            self._qdot_o = self._ca.normal_flow(self._mdot_o, self._Xo)
        return self._qdot_o

    @property
    def fuel(self) -> CompositionType:
        """ Access to fuel mole fractions. """
        return self._Xc

    @property
    def oxidizer(self) -> CompositionType:
        """ Access to oxidizer mole fractions. """
        return self._Xo

    @property
    def fuel_normal_density(self) -> float:
        """ Fuel normal density. """
        if not hasattr(self, "_rho_c"):
            self._rho_c = self._ca.normal_density(self._Xc)
        return self._rho_c

    @property
    def oxidizer_normal_density(self) -> float:
        """ Oxidizer normal density. """
        if not hasattr(self, "_rho_o"):
            self._rho_o = self._ca.normal_density(self._Xo)
        return self._rho_o

    @property
    def production_water(self) -> float:
        """ Access to complete combustion H2O mass flow rate. """
        if not hasattr(self, "_m_h2o"):
            raise RuntimeError("Emissions not computed")
        return self._m_h2o

    @property
    def production_carbon_dioxide(self) -> float:
        """ Access to complete combustion CO2 mass flow rate. """
        if not hasattr(self, "_m_co2"):
            raise RuntimeError("Emissions not computed")
        return self._m_co2

    def __repr__(self) -> str:
        """ Standard representation of class instance. """
        args = f"P={self._power:.4e} kW LHV={self._lhv:.4e} MJ/kg"
        return f"<CombustionPowerSupply {args} />"

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        mdot = self._mdot_c + self._mdot_o
        qdot = self.fuel_volume + self.oxidizer_volume
    
        data = [
            ("Required power", "kW", self._power),
            ("Lower heating value", "MJ/kg", self._lhv),

            ("Fuel mass flow rate", "kg/h", 3600*self._mdot_c),
            ("Oxidizer mass flow rate", "kg/h", 3600*self._mdot_o),
            ("Total mass flow rate", "kg/h", 3600*mdot),

            ("Fuel volume flow rate", "Nm³/h", self.fuel_volume),
            ("Oxidizer volume flow rate", "Nm³/h", self.oxidizer_volume),
            ("Total volume flow rate", "Nm³/h", qdot),
        ]

        if hasattr(self, "_m_h2o"):
            mdot = self._m_h2o + self._m_co2

            data.extend([
                ("Water production", "kg/h", 3600*self._m_h2o),
                ("Carbon dioxide production", "kg/h", 3600*self._m_co2),
                ("Total emissions", "kg/h", 3600*mdot),
            ])
        return data

    def report(self, *args, **kwargs) -> str:
        """ Provides a report of the energy source. """
        kwargs.setdefault("headers", ["Property", "Unit", "Value"])
        return super().report(*args, **kwargs)


class CombustionAtmosphereMixer:
    """ Provides addition of thermochemical quantities.

    Parameters
    ----------
    mechanism: str
        Kinetics mechanism/database to use in computations.
    """
    def __init__(self, mechanism: str) -> None:
        self._mechanism = mechanism
        self._quantity = None

    def _new_quantity(self, mass, T, P, X):
        """ Create a new quantity with provided state. """
        solution = ct.Solution(self._mechanism)
        solution.TPX = T, P, X
        return ct.Quantity(solution, mass=mass)

    def add_quantity(self,
            mass: float,
            X: CompositionType,
            T: float = 273.15,
            P: float = ct.one_atm
        ) -> ct.Quantity:
        """ Add quantity at given state to global mixture.

        Parameters
        ----------
        mass: float
            Amount of matter in kilograms.
        X: CompositionType
            Composition of quantity in mole fractions.
        T: float = 273.15
            Solution temperature in kelvin.
        P: float = ct.one_atm
            Solution pressure in pascal.
        """
        # XXX: maybe consider this and add warning!
        # SMALL_MASS = 1.0e-12
        # mass = mass if mass > 0 else SMALL_MASS
        quantity = self._new_quantity(mass, T, P, X)

        if self._quantity is None:
            self._quantity = quantity
        else:
            self._quantity += quantity

        return copy_quantity(quantity)

    @property
    def solution(self) -> ct.Quantity:
        """ Provides access to computed solution, if any. """
        if self._quantity is None:
            raise RuntimeError("First add some quantities")
        return self._quantity


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
