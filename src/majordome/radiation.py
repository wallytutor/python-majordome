# -*- coding: utf-8 -*-
from abc import ABC
from abc import abstractmethod
from typing import Any
from numpy.polynomial import Polynomial
import numpy as np
import yaml

from .common import DATA


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
    def absorption_coefs(self) -> np.ndarray:
        """ Component gases absorption coefficients [1/m]. """
        return self._kabs

    @property
    def gases_weights(self) -> np.ndarray:
        """ Fractional weight of model component gases [-]. """
        return self._awts

    @staticmethod
    def eval_emissivity(a: np.ndarray, k: np.ndarray, pL: float) -> float:
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
        self._p_ccoefs.insert(0, (1-np.sum(self._p_ccoefs, axis=0)).tolist())

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

    def _domain_h2o(self, iband, MrOrig, Tr, pfac, kabs, awts):
        """ Add modified contribution to H2O-rich mixtures. """
        f = (1e8 - MrOrig) / (1e8 - 4.0)
        kabs = self.relax(f, kabs, self._kh2o[iband] * pfac)
        awts = self.relax(f, awts, self._p_bh2o[iband](Tr))
        return kabs, awts

    def _domain_co2(self, iband, MrOrig, Tr, pfac, kabs, awts):
        """ Add modified contribution to CO2-rich mixtures. """
        f = (0.01 - MrOrig) / 0.01
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
