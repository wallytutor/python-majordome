# -*- coding: utf-8 -*-
from importlib import resources
from pathlib import Path

DATA = Path(str(resources.files("majordome_simulation").joinpath("data")))
""" Path to project data folder. """
