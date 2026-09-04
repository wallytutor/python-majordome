# -*- coding: utf-8 -*-

from .._imports import setup_lazy_exports

__getattr__, __dir__ = setup_lazy_exports(__name__, globals(), {
    "majordome_warning": ".internals",

    "AbstractReportable": ".common",
    "ReadTextData": ".common",
    "InteractiveSessionTracer": ".common",
    "InteractiveSession": ".common",
    "Capturing": ".common",
    "ColorPrint": ".common",
    "ArchitecturalFormatUSParser": ".common",
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
})
