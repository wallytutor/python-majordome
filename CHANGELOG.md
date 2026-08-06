# Changelog

## Ongoing Development

- Fixed `Containerfile` and Linux build workflow based on the new project structure.

- Because documentation is under revision, its automatic creation has been disabled in the release script and now requires the `-Docs` switch. This is a temporary measure and will be re-enabled once the documentation is updated.

- Lazy import logic was extended for the core package, so that using `from majordome import ...` works directly for all exported items (currently the Rust wrappers are not exposed as their lazy mechanism is unfinished).

- Added OpenFOAM sample data and examples for illustrating the loading of tabular data using the implementations of `AbstractFoamDataLoader`.

- Documentation of `majordome.simulation` has been broken down into more manageable blocks. This structure is to be used in other modules in the future.

- Fixed missing re-export of `FoamLagrangianTable` in `majordome.simulation` and minor improvements in the OpenFOAM interfaces.

## 1.3.0 - 2026-08-04

- Add keywork `notebook` to `AbstractReportable` so that user code no longer needs to use a `display(Markdown(...))` boilerplate code.

- New methods added to `majordome.utilities.plotting.MajordomePlot` for a smoother interaction, especially when using the wrapper `plot_xy`. Now one can call `add_curve`, `xlabel`, `ylabel` with a possible `where=k` keyword argument to modify the `k`-th plot.

- Split core into multiple crates for easier maintenance and faster compilation.

- Added preliminary version of `majordome.autodiff` and `majordome.calphad` (in experimental mode) exposing Rust implementations.

- Split modules with lazy imports (no impact for application programs), largely decreasing the typical import time of library functions.

- Increased maturity and documentation of `majordome.engineering.SkinFrictionFactor` and the associated `majordome.engineering.WallGradingCalculator`.

## 1.2.0 - 2026-05-13

- Add internal warning manager to control the display of warnings across the package.

- Cantera data files are added to path no matter which module is loaded if it imports from `majordome.data`.

- Added `majordome.simulation.FoamPostProcessingLoader` for automatic plotting of postprocessing folder with multiple restart points. Because large files may be needed, polars has been upgraded to a mandatory dependency.

- Added .NET extras for educational purposes. The code is currently not part of the Python package and is highly experimental.

- Included `majordome.utilities.sympy_symbols_factory` utility to create SymPy symbols in batch, with support for custom naming conventions and indexing.

## 1.1.0 - 2026-04-29

- Updated `majordome.utilities.LatexDelimiterNormalizer` to handle parenthesized LaTeX blocks and inline expressions (mostly to support outputs of OCR when extracting text from PDFs).

- Added `majordome.utilities.MarkdownLinkStripper` utility to remove Markdown links from text. User can control whether to remove all links or only the entries corresponding to figures included in the text.

- Some type hinting and docstring improvements in `majordome.utilities`.

- Experimental support for JupyterLab extension `mdmagic` reintroduced to the project. This feature needs a JS developer contributor to be fully implemented and tested, but the groundwork has been laid in the codebase. The extension will allow users to write Markdown in code cells for use with `majordome.magic.MdMagic`.
