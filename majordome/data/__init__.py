# -*- coding: utf-8 -*-
from importlib import resources
import os
from pathlib import Path
import cantera as ct

DATA = Path(str(resources.files("majordome").joinpath("data")))
""" Path to project data folder. """

ct.add_directory(DATA)
ct.add_directory(DATA / "thermo")

current_env = os.environ.get("CANTERA_DATA", "")
thermo_str = str(DATA / "thermo")
data_str = str(DATA)
paths = [p for p in [data_str, thermo_str, current_env] if p]
os.environ["CANTERA_DATA"] = os.pathsep.join(paths)
