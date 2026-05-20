# -*- coding: utf-8 -*-
import importlib

_LAZY_EXPORTS = {
    "majordome_warning": ".internals",
    "AbstractReportable": ".common",
    "ReadTextData": ".common",
    "InteractiveSessionTracer": ".common",
    "InteractiveSession": ".common",
    "Capturing": ".common",
    "ColorPrint": ".common",
    "has_program": ".common",
    "program_path": ".common",
    "first_in_path": ".common",
    "download_file": ".common",
    "normalize_string": ".common",
    "report_title": ".common",
    "safe_remove": ".common",
    "bounds": ".common",
    "within": ".common",
    "apply": ".common",
    "sci_to_latex_decimal": ".common",
    "sympy_symbols_factory": ".common",
    "ProgressBar": ".progress",
    "progress_bar": ".progress",
    "Params": ".plotting",
    "SigIn": ".plotting",
    "SigOut": ".plotting",
    "MajordomePlot": ".plotting",
    "PowerFormatter": ".plotting",
    "centered_colormap": ".plotting",
    "plot_xy": ".plotting",
    "plot2d": ".plotting",
    "is_tex": ".latex",
    "list_tex_templates": ".latex",
    "load_tex_template": ".latex",
    "fill_tex_template": ".latex",
    "graphics_path": ".latex",
    "include_figure": ".latex",
    "url_link": ".latex",
    "split_line": ".latex",
    "section": ".latex",
    "itemize": ".latex",
    "Itemize": ".latex",
    "two_columns": ".latex",
    "beamer_slide": ".latex",
    "beamer_two_columns": ".latex",
    "BeamerSlides": ".latex",
    "SlideContentWriter": ".latex",
    "FuncArguments": ".argument_parsing",
    "PdfExtracted": ".pdftools",
    "PdfToTextConverter": ".pdftools",
    "LatexDelimiterNormalizer": ".markdown",
    "MarkdownLinkStripper": ".markdown",
}

__all__ = list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    if name in _LAZY_EXPORTS:
        submodule_path = _LAZY_EXPORTS[name]
        submodule = importlib.import_module(submodule_path, __package__)
        exported_item = getattr(submodule, name)
        globals()[name] = exported_item
        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return list(globals().keys()) + __all__
