# -*- coding: utf-8 -*-
import cantera as ct
from importlib import resources
from pathlib import Path

DATA = Path(str(resources.files("majordome").joinpath("data")))
""" Path to project data folder. """

ct.add_directory(DATA)
ct.add_directory(DATA / "thermo")
