# -*- coding: utf-8 -*-

from importlib import resources
from pathlib import Path

DATA = Path(str(resources.files("majordome").joinpath("data")))
""" Path to project data folder. """


def enable_cantera() -> None:
    """ Make cantera data available. """
    import os
    import cantera as ct

    ct.add_directory(DATA)
    ct.add_directory(DATA / "thermo")

    # Pretty sure this is not required: yes it is, somehow...
    os.environ["CANTERA_DATA"] = os.pathsep.join(
        [
            str(DATA),
            str(DATA / "thermo"),
            os.environ.get("CANTERA_DATA", "")
        ]
    )


enable_cantera()
