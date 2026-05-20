# -*- coding: utf-8 -*-
import warnings

def _simple_warning(message, category, filename, lineno, file=None, line=None):
    return f"Majordome {category.__name__}: {message}\n"


def majordome_warning(message, *args, **kwargs):
    warnings.formatwarning = _simple_warning
    warnings.warn(message, *args, **kwargs)
