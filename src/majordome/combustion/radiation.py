# -*- coding: utf-8 -*-
from numpy.polynomial import Polynomial
import numpy as np


class WSGGRadlibBordbar2020:
    """ Weighted sum of gray gases radiation properties model.
    
    Pure Python implementation of Radlib model from Bordbar (2020).
    """
    @staticmethod
    def emissivity_gg(a, k, pL):
        return a * (1 - np.exp(-k * pL))
