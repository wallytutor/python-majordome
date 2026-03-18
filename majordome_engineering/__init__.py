# -*- coding: utf-8 -*-
from importlib import resources
from pathlib import Path
import cantera as ct

from .data import DATA

__all__ = ["DATA"]

ct.add_directory(DATA)