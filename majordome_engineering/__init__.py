# -*- coding: utf-8 -*-
from importlib import resources
from pathlib import Path
import cantera as ct

__all__ = []

DATA = Path(str(resources.files("majordome_engineering").joinpath("data")))
""" Path to project data folder. """

ct.add_directory(DATA)