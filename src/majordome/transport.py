# -*- coding: utf-8 -*-
import cantera as ct
import numpy as np


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
