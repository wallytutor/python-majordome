# -*- coding: utf-8 -*-
from typing import Any
from numpy.polynomial import Polynomial
import numpy as np
import yaml

from .common import DATA


class RadiationModels:
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
    def emissivity(a, k, pL):
        return a * (1 - np.exp(-k * pL))
    

class WSGGRadlibBordbar2020:
    """ Weighted sum of gray gases radiation properties model.
    
    Pure Python implementation of Radlib model from Bordbar (2020).
    """
    POLY_ORDER = 4

    @classmethod
    def load_data(cls):
        data = RadiationModels.load_raw_data(cls.__name__)
        data = np.asarray(data["data"]).reshape((-1, cls.POLY_ORDER+1))
        return data


