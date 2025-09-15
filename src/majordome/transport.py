# -*- coding: utf-8 -*-
from textwrap import dedent
from numpy.typing import NDArray
from scipy.optimize import curve_fit
from tabulate import tabulate
import cantera as ct
import numpy as np
import pandas as pd

from .common import GRAVITY, standard_plot


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

    Note
    ----
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
        self._sol = ct.Solution(mech, name)

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

    def _diff_coefs(self, vname) -> np.ndarray:
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

    def grashof(self, Tw: float, H: float, g: float = GRAVITY) -> float:
        """ Evaluates the Grashof number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = GRAVITY
            Acceleration of gravity at location [m/s²].
        """
        self._gr = self.bydef_grashof(Tw, self._sol.T, self._beta,
                                      self._nu, g, H)
        self._gr_data = f"Tw={Tw}, H={H}, g={g}"
        return self._gr

    def rayleigh(self, Tw: float, H: float, g: float = GRAVITY) -> float:
        """ Evaluates the Rayleigh number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = GRAVITY
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
    def solution(self) -> ct.Solution:
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
    def __init__(self, mech: str, *, name = None) -> None:
        self._sol = ct.Solution(mech, name)
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
        arr = ct.SolutionArray(self._sol, shape=(T.shape[0],))

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

    @standard_plot(shape=(1, 2), resized=(10, 5))
    def plot_species(self, ax, name, loc=2):
        """ Generate verification plot for a given species. """
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
