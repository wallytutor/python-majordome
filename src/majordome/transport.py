# -*- coding: utf-8 -*-
from abc import ABC
from typing import Any
from textwrap import dedent
from numpy.polynomial import Polynomial
from numpy.typing import NDArray
from scipy.optimize import curve_fit
from tabulate import tabulate
import cantera as ct
import numpy as np
import pandas as pd
import yaml

from ._corelib import constants
from .common import DATA
from .plotting import MajordomePlot


class EffectiveThermalConductivity:
    """ Models for effective thermal conductivity of granular media. """
    @staticmethod
    def maxwell_garnett(phi: float, k_g: float, k_s: float) -> float:
        """ Maxwell-Garnett effective medium theory approximation.

        Parameters
        ----------
        phi: float
            Solids packing fraction in packed bed [-].
        k_g: float
            Thermal conductivity of gas [W/(m.K)]
        k_s: float
            Thermal conductivity of solids [W/(m.K)]

        Returns
        -------
        float
            Effective domain thermal conductivity [W/(m.K)].
        """
        f_sum = 2 * k_g + k_s
        f_dif = k_s - k_g

        num = f_sum + 2 * phi * f_dif
        den = f_sum - 1 * phi * f_dif

        return k_g * num / den

    @staticmethod
    def singh1994(T: float, phi: float, d_p: float, k_s: float,
                  epsilon: float) -> float:
        """ Singh (1994) model for effective thermal conductivity.

        Parameters
        ----------
        T: float
            Temperature of solids [K].
        phi: float
            Solids packing fraction in packed bed [-].
        d_p: float
            Solids characteristic particle size [m].
        k_s: float
            Thermal conductivity of solids [W/(m.K)]
        epsilon: float
            Average emissivity of solids [-]. For solids with temperature
            dependent emissivity, it is worth estimating the right value
            for the temperature range being studied.

        Returns
        -------
        float
            Effective domain thermal conductivity [W/(m.K)].
        """
        a = 4.0 * d_p * ct.stefan_boltzmann * T**3
        b = (1.5353 / epsilon) * (k_s / a)**0.8011

        k_p = phi * k_s
        k_r = a * (0.5756 * epsilon * np.arctan(b) + 0.1843)

        return k_p + k_r


class SolutionDimless:
    """ Provides evaluation of dimensionless numbers for a solution.

    For keeping the API simple (as are the main use cases of this class),
    after accessing `solution` to setting its state, it is up to the user
    to call `update` as there is no pre-defined hook. It is not possible
    to implement such behavior of automatic call because you may simply
    retrieve the solution object and set the state later, after a hook
    has been called. The recommended way of setting state of the mixture
    is through `set_state` (see below).

    Parameters
    ----------
    mech: str
        Name or path to Cantera YAML solution mechanism.
    name = None
        Name of phase in mechanism if not a single one is present.
    """
    def __init__(self, mech: str, *, name = None) -> None:
        supported = ["mixture-averaged"]
        self._sol = ct.composite.Solution(mech, name)

        if (model := self._sol.transport_model) not in supported:
            raise ValueError(f"Unsupported transport model {model}")

        # XXX: this alsow will create all the symbols on first call
        self._reset_memory()

    def _reset_memory(self):
        """ Reset all previously computed numbers. """
        self._re, self._re_data = None, None
        self._pr, self._pr_data = None, None
        self._sc, self._sc_data = None, None
        self._pe_mass, self._pe_mass_data = None, None
        self._pe_heat, self._pe_heat_data = None, None
        self._gr, self._gr_data = None, None
        self._ra, self._ra_data = None, None

    def _add(self, data, name, val, args):
        """ Add a number to the list if it has been evaluated. """
        if val is not None:
            data.append((name, val, args))

    def _diff_coefs(self, vname) -> NDArray[np.float64]:
        """ Return required diffusion coefficients. """
        D = getattr(self._sol, vname)
        return D[D > 0]

    # -----------------------------------------------------------------
    # BY DEFINITION
    # -----------------------------------------------------------------

    @staticmethod
    def bydef_reynolds(rho, mu, U, L):
        """ Reynolds number by definition. """
        return rho * U * L / mu

    @staticmethod
    def bydef_prandtl(cp, mu, k):
        """ Prandtl number by definition. """
        return cp * mu / k

    @staticmethod
    def bydef_schmidt(rho, mu, D):
        """ Schmidt number by definition. """
        return mu / (rho * D)

    @staticmethod
    def bydef_peclet(U, L, D):
        """ Péclet number by definition. """
        return L * U / D

    @staticmethod
    def bydef_grashof(Tw, T, beta, nu, g, H):
        """ Grashof number by definition. """
        return beta * g * (Tw - T) * H**3 / nu**2

    @staticmethod
    def bydef_rayleigh(Tw, T, alpha, beta, nu, g, H):
        """ Rayleigh number by definition. """
        return beta * g * (Tw - T) * H**3 / (nu * alpha)

    # -----------------------------------------------------------------
    # WRAPPERS
    # -----------------------------------------------------------------

    def reynolds(self, U: float, L: float) -> float:
        """ Evaluates Reynolds number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic length [m].
        """
        self._re = self.bydef_reynolds(self._rho, self._mu, U, L)
        self._re_data = f"U={U}, L={L}"
        return self._re

    def prandtl(self) -> float:
        """ Evaluates Prandtl number for solution. """
        self._pr = self.bydef_prandtl(self._cp, self._mu, self._k)
        self._pr_data = ""
        return self._pr

    def schmidt(self, vname: str = "mix_diff_coeffs") -> float:
        """ Evaluates Schmidt number for solution.

        Parameters
        ----------
        vname: str = "mix_diff_coeffs"
            Name of diffusion coefficient attribute to use, depending on
            the mass/mole units needs in your calculations. For more details
            please consult `cantera.Solution` documentation.
        """
        D = max(self._diff_coefs(vname))
        self._sc = self.bydef_schmidt(self._rho, self._mu, D)
        self._sc_data = vname
        return self._sc

    def peclet_mass(self, U: float, L: float,
                    vname: str = "mix_diff_coeffs") -> float:
        """ Evaluates the mass Péclet number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic axial length [m].
        vname: str = "mix_diff_coeffs"
            Name of diffusion coefficient attribute to use, depending on
            the mass/mole units needs in your calculations. For more details
            please consult `cantera.Solution` documentation.
        """
        D = max(self._diff_coefs(vname))
        self._pe_mass = self.bydef_peclet(U, L, D)
        self._pe_mass_data = f"U={U}, L={L}, {vname}"
        return self._pe_mass

    def peclet_heat(self, U: float, L: float) -> float:
        """ Evaluates the heat Péclet number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic axial length [m].
        """
        self._pe_heat = self.bydef_peclet(U, L, self._alpha)
        self._pe_heat_data = f"U={U}, L={L}"
        return self._pe_heat

    def grashof(self, Tw: float, H: float,
                g: float = constants.GRAVITY) -> float:
        """ Evaluates the Grashof number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = constants.GRAVITY
            Acceleration of gravity at location [m/s²].
        """
        self._gr = self.bydef_grashof(Tw, self._sol.T, self._beta,
                                      self._nu, g, H)
        self._gr_data = f"Tw={Tw}, H={H}, g={g}"
        return self._gr

    def rayleigh(self, Tw: float, H: float,
                 g: float = constants.GRAVITY) -> float:
        """ Evaluates the Rayleigh number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = constants.GRAVITY
            Acceleration of gravity at location [m/s²].
        """
        self._ra = self.bydef_rayleigh(Tw, self._sol.T, self._alpha,
                                       self._beta, self._nu, g, H)
        self._ra_data = f"Tw={Tw}, H={H}, g={g}"
        return self._ra

    # -----------------------------------------------------------------
    # UTILITIES
    # -----------------------------------------------------------------

    def update(self):
        """ Retrieve all required properties from solution. """
        self._rho  = self._sol.density_mass
        self._mu   = self._sol.viscosity
        self._cp   = self._sol.cp_mass
        self._k    = self._sol.thermal_conductivity
        self._beta = self._sol.thermal_expansion_coeff

        self._nu = self._mu / self._rho
        self._alpha = self._k / (self._rho * self._cp)

    @property
    def solution(self) -> ct.composite.Solution:
        """ Provides handle for setting state of solution. """
        self._reset_memory()
        return self._sol

    def set_state(self, *args, tuple_name="TPX"):
        """ Set state of system with given arguments. """
        setattr(self.solution, tuple_name, args)
        self.update()

    def report(self, show_fitting_errors: bool = False,
               tablefmt: str = "simple") -> str:
        """ Produces a table for inspecting all computed values. """
        data = []
        self._add(data, "Reynolds", self._re, self._re_data)
        self._add(data, "Prandtl",  self._pr, self._pr_data)
        self._add(data, "Schmidt",  self._sc, self._sc_data)
        self._add(data, "Péclet (mass)", self._pe_mass, self._pe_mass_data)
        self._add(data, "Péclet (heat)", self._pe_heat, self._pe_heat_data)
        self._add(data, "Grashof", self._gr, self._gr_data)
        self._add(data, "Rayleigh", self._ra, self._ra_data)

        if show_fitting_errors:
            self._add(data, " ",  " ", " ")
            fitting_errors = self._sol.transport_fitting_errors
            data.extend([(k, v, "") for k, v in fitting_errors.items()])

        return tabulate(data)


class SutherlandFitting:
    """ Helper for fitting Sutherland parameters for all species in solution.

    Parameters
    ----------
    mech: str
        Name or path to Cantera YAML solution mechanism.
    name = None
        Name of phase in mechanism if not a single one is present.
    """
    def __init__(self, mech: str, *, name: str | None = None) -> None:
        self._sol = ct.composite.Solution(mech, name)
        self._data = None
        self._visc = None

    def _get_species(self, species_names: list[str]):
        """ Return array of selected species for fitting. """
        allowed_species = self._sol.species_names

        if species_names is not None:
            # TODO add some warnings here for unknown species
            return [n for n in species_names if n in allowed_species]

        return allowed_species

    def fit(self, T: NDArray[np.float64], P: float = ct.one_atm,
            species_names: list[str] = None,
            p0: tuple[float, float] = (1.0, 1000)) -> None:
        """ Manage fitting of selected species from mechanism.

        Parameters
        ----------
        T: NDArray[float]
            Array of temperatures over which fit model [K].
        P: float = ct.one_atm
            Operating pressure for fitting [Pa].
        species_names: list[str] = None
            Names of species to be fitted; if none is provided, then
            all species in database are processed.
        p0: tuple[float, float] = (1.0, 1000)
            Initial guess for fitting; values are provided in (uPa.s, K)
            units (not the usual Pa.s values for readability of values).

        Returns
        -------
        pd.DataFrame
            Table with evaluated proper
        """
        data = []
        visc = pd.DataFrame({"T": T})
        arr = ct.composite.SolutionArray(self._sol, shape=(T.shape[0],))

        for name in self._get_species(species_names):
            arr.TPY = T, P, {name: 1}
            visc[name] = mu = 1e6 * arr.viscosity
            popt = curve_fit(SutherlandFitting.bydef, T, mu, p0=p0)[0]

            mu_fit = SutherlandFitting.bydef(T, *popt)
            err = np.sqrt(np.mean((mu_fit - mu) ** 2))

            data.append((name, popt[0], popt[1], err))

        names = ["species", "As [uPa.s]", "Ts [K]", "RMSE [uPa.s]"]
        self._data = pd.DataFrame(data, columns=names)
        self._visc = visc
        return self._data

    @staticmethod
    def bydef(T: NDArray[np.float64], As: float, Ts: float) -> NDArray[np.float64]:
        """ Sutherland transport parametric model as used in OpenFOAM.

        Function provided to be used in curve fitting to establish Sutherland
        coefficients from data computed by Cantera using Lennard-Jones model.
        Reference: https://cfd.direct/openfoam/user-guide/thermophysical.

        Parameters
        ----------
        T : NDArray[np.float64]
            Temperature array given in kelvin.
        As : float
            Sutherland coefficient.
        Ts : float
            Sutherland temperature.

        Returns
        -------
        NDArray[np.float64]
            The viscosity in terms of temperature.
        """
        return As * np.sqrt(T) / (1 + Ts / T)

    @MajordomePlot.new(shape=(1, 2), size=(10, 5))
    def plot_species(self, name=None, loc=2, *, plot=None, **kwargs):
        """ Generate verification plot for a given species. """
        fig, ax = plot.subplots()

        where = (self._data["species"] == name)
        As, Ts = self._data.loc[where].iloc[0, 1:-1].to_numpy()

        T = self._visc["T"].to_numpy()
        Y = self._visc[name].to_numpy()
        Z = self.bydef(T, As, Ts)

        err = 100 * (Z - Y) / Y
        ax[0].plot(T, Y, label="Cantera")
        ax[0].plot(T, Z, label="Sutherland")
        ax[1].plot(T, err)

        ax[0].set_xlabel("Temperature [$K$]")
        ax[1].set_xlabel("Temperature [$K$]")
        ax[0].set_ylabel("Viscosity [$\\mu{}Pa\\,s$]")
        ax[1].set_ylabel("Fitting error [%]")
        ax[0].legend(loc=loc)

    @property
    def coefs_table(self) -> pd.DataFrame:
        """ Retrieve table of fitted model for all species. """
        if self._data is None:
            raise ValueError("First call `fit` for generating data.")
        return self._data

    @property
    def viscosity(self) -> pd.DataFrame:
        """ Retrieve viscosity of species used in fitting. """
        if self._visc is None:
            raise ValueError("First call `fit` for generating data.")
        return self._visc

    def to_openfoam(self) -> str:
        """ Convert fitting to OpenFOAM format. """
        if self._data is None:
            raise ValueError("First call `fit` for generating data.")

        fmt = dedent("""
            /* --- RMSE {3} ---*/
            "{0}"
            {{
                transport
                {{
                    As  {1:.10e};
                    Ts  {2:.10e};
                }}
            }}\
            """)

        data = pd.DataFrame(self._data.copy())
        data["As [uPa.s]"] *= 1.0e-06

        return "".join(fmt.format(*row) for _, row in data.iterrows())


class AbstractRadiationModel(ABC):
    @staticmethod
    def load_raw_data(name: str) -> Any:
        """ Load raw data for feeding an implementation. """
        with open(DATA / "wsgg.yaml") as fp:
            data = yaml.safe_load(fp)

        for dataset in data["database"]:
            if dataset["name"] == name:
                return dataset

        raise ValueError(f"Dataset {name} not found!")

    @staticmethod
    def relax(alpha, a, b):
        """ Compute a fractional mixture of values. """
        return alpha * a + (1 - alpha) * b


class AbstractWSGG(AbstractRadiationModel):
    """ Abstract weighted sum of gray gases (WSGG) model. """
    def __init__(self, num_gases):
        super().__init__()
        self._kabs = np.zeros(num_gases)
        self._awts = np.zeros(num_gases)

    @property
    def absorption_coefs(self) -> NDArray[np.float64]:
        """ Component gases absorption coefficients [1/m]. """
        return self._kabs

    @property
    def gases_weights(self) -> NDArray[np.float64]:
        """ Fractional weight of model component gases [-]. """
        return self._awts

    @staticmethod
    def eval_emissivity(a: NDArray[np.float64],
                        k: NDArray[np.float64],
                        pL: float) -> NDArray[np.float64]:
        """ Compute integral emissivity over optical path. """
        return a * (1 - np.exp(-k * pL))

    def emissivity(self, pl: float) -> float:
        """ Compute integral emissivity over optical path. """
        return np.sum(self.eval_emissivity(self._awts, self._kabs, pl))


class WSGGRadlibBordbar2020(AbstractWSGG):
    """ Weighted sum of gray gases radiation properties model.

    Pure Python implementation of Radlib model from Bordbar (2020).

    Attributes
    ----------
    NUM_COEFS = 5
        Number of coefficients in polynomials (order + 1).
    NUM_GRAYS = 4
        Number of gray gases accounted for without clear gas.
    T_MIN = 300.0
        Minimum temperature accepted by the model [K].
    T_MAX = 2400.0
        Maximum temperature accepted by the model [K].
    T_RED = 1200.0
        Temperature used for computing dimensionless temperature [K].
    P_TOL = 1.0e-10
        Tolerance of carbon dioxide partial pressure [atm].
    MR_LIM_CO2 = 0.01
        Limit of `Mr` corresponding to CO2-rich mixtures.
    MR_LIM_H2O = 4.0
        Limit of `Mr` corresponding to H2O-rich mixtures.
    MR_LIM_INF = 1.0e+08
        Maximum allowed value of `Mr`.
    """
    NUM_COEFS = 5
    NUM_GRAYS = 4
    T_MIN = 300.0
    T_MAX = 2400.0
    T_RED = 1200.0
    P_TOL = 1.0e-10
    MR_LIM_CO2 = 0.01
    MR_LIM_H2O = 4.0
    MR_LIM_INF = 1.0e+08

    def __init__(self) -> None:
        super().__init__(self.NUM_GRAYS + 1)

        data = self.load_raw_data(self.__class__.__name__)
        data = np.asarray(data["data"]).reshape((-1, self.NUM_COEFS))

        self._parse_coefs(data)
        self._build_polynomials()

    # -----------------------------------------------------------------
    # Construction
    # -----------------------------------------------------------------

    def _parse_coefs(self, data):
        """ Retrieve coefficients from ranges of database. """
        self._cCoef = data[0:20]
        self._dCoef = data[20:24]
        self._bco2  = data[24:28]
        self._bh2o  = data[28:32]
        self._kco2  = data[32]
        self._kh2o  = data[33]

        shape = (self.NUM_GRAYS, self.NUM_COEFS, -1)
        self._cCoef = self._cCoef.reshape(shape)

    def _build_polynomials(self):
        # Parse `cCoef` and balance clear band.
        self._p_ccoefs = list(map(lambda c: list(map(Polynomial, c)), self._cCoef))
        self._p_ccoefs.insert(0, (1.0 - np.sum(self._p_ccoefs, axis=0)).tolist())

        # Parse `dCoef` and add zero-valued clear band.
        self._p_dcoefs = list(map(Polynomial, self._dCoef))
        self._p_dcoefs.insert(0, Polynomial([0]))

        def get_poly_spec(b):
            """ Parse species coefficients and balance clear band. """
            p = list(map(Polynomial, b))
            p.insert(0, 1.0 - sum(p))
            return p

        self._p_bco2 = get_poly_spec(self._bco2)
        self._p_bh2o = get_poly_spec(self._bh2o)

    # -----------------------------------------------------------------
    # Models
    # -----------------------------------------------------------------

    def _domain_h2o(self, iband, Mr, Tr, pfac, kabs, awts):
        """ Add modified contribution to H2O-rich mixtures. """
        f = (self.MR_LIM_INF - Mr) / (self.MR_LIM_INF - self.MR_LIM_H2O)
        kabs = self.relax(f, kabs, self._kh2o[iband] * pfac)
        awts = self.relax(f, awts, self._p_bh2o[iband](Tr))
        return kabs, awts

    def _domain_co2(self, iband, Mr, Tr, pfac, kabs, awts):
        """ Add modified contribution to CO2-rich mixtures. """
        f = (self.MR_LIM_CO2 - Mr) / self.MR_LIM_CO2
        kabs = self.relax(f, self._kco2[iband] * pfac, kabs)
        awts = self.relax(f, self._p_bco2[iband](Tr),  awts)
        return kabs, awts

    @staticmethod
    def _soot_contrib(T, fv):
        """ Evaluate contribution of soot volume fraction. """
        return 1817 * fv * T if fv > 0.0 else 0.0

    def _eval_band(self, iband, Ml, Mr, Tr, P_h2o, P_co2, fvsoot):
        """ Evaluate coefficients for a specific gray gas band. """
        kabs = self._p_dcoefs[iband](Mr) * (P_co2 + P_h2o)
        awts = Polynomial([p(Mr) for p in self._p_ccoefs[iband]])(Tr)

        if Ml < self.MR_LIM_CO2:
            kabs, awts = self._domain_co2(iband, Ml, Tr, P_co2, kabs, awts)

        if Ml > self.MR_LIM_H2O:
            kabs, awts = self._domain_h2o(iband, Ml, Tr, P_h2o, kabs, awts)

        kabs += self._soot_contrib(Tr * self.T_RED, fvsoot)

        self._kabs[iband] = kabs
        self._awts[iband] = awts

    def _eval_coefs(self, T, P_h2o, P_co2, fvsoot):
        """ Evaluate coefficients for the whole mixture. """
        Mr = P_h2o / (P_co2 + self.P_TOL)
        Ml = min(Mr, self.MR_LIM_INF)
        Mr = np.clip(Mr, self.MR_LIM_CO2, self.MR_LIM_H2O)
        Tr = np.clip(T, self.T_MIN, self.T_MAX) / self.T_RED

        for iband in range(self.NUM_GRAYS + 1):
            self._eval_band(iband, Ml, Mr, Tr, P_h2o, P_co2, fvsoot)

    # -----------------------------------------------------------------
    # API
    # -----------------------------------------------------------------

    def __call__(self, L: float, T: float, P: float, x_h2o: float,
                 x_co2: float, fvsoot: float = 0.0) -> float:
        """ Evaluate total emissivity of gas over path.

        Parameters
        ----------
        L: float
            Optical path for emissivity calculation [m].
        T: float
            Gas temperature [K].
        P: float
            Gas total pressure [Pa].
        x_h2o: float
            Mole fraction of water [-].
        x_co2: float
            Mole fraction of carbon dioxide [-]
        fvsoot: float
            Volume fraction soot [-].

        Returns
        -------
        float
            Total emissivity integrated over optical path.
        """
        P_atm = P / 101325
        P_h2o = P_atm * x_h2o
        P_co2 = P_atm * x_co2

        self._eval_coefs(T, P_h2o, P_co2, fvsoot)
        return self.emissivity((P_h2o + P_co2) * L)
