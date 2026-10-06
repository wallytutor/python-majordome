# -*- coding: utf-8 -*-


def import_headless_pyvista():
    """ Import PyVista in a headless environment. """
    import os

    # Mute C-level stderr (File Descriptor 2) immediately
    _devnull = os.open(os.devnull, os.O_WRONLY)
    os.dup2(_devnull, 2)
    os.close(_devnull)

    # Force headless off-screen environment
    os.environ["VTK_DEFAULT_RENDER_WINDOW_HEADLESS"] = "1"
    os.environ["PYVISTA_OFF_SCREEN"] = "true"
    os.environ["PYVISTA_USE_IPYVISTA"] = "false"

    import pyvista as pv
    pv.set_jupyter_backend("static")

    return pv
