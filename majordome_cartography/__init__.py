# -*- coding: utf-8 -*-
from importlib import resources
from pathlib import Path
from .gpx import GpxManager
from .maps import Tiles, map_at_location, display_track

DATA = Path(str(resources.files("majordome_cartography").joinpath("data")))
""" Path to project data folder. """

__all__ = [
    "GpxManager",
    "Tiles",
    "map_at_location",
    "display_track",
]
