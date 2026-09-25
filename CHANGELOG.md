# Changelog

- Workflow improvements in `majordome.openfoam.post` for handling different separators in report files. Previously it was assumed that only tabs were used, but in fact there is no standard separator. Some reports, such as `#includeFunc probes` can generate several files inside the report, so a regular expression based parameter `select` has been added to `FoamPostProcessingLoaded.load_report`, allowing for selection of the right one.

- Added `FoamHelpers.decompose_hierarchical_coefs` to `majordome.openfoam.run` to support hierarchical domain decomposition. Added an extra safety layer to `FoamHelpers.copy_dict_orig` and made some minor class improvements.

- Added bidirectional YAML case conversion interface in `majordome.openfoam.yaml` (`foam_to_yaml`, `yaml_to_foam`, `FoamYamlCase`), preserving preprocessor directives (`#include`, `#includeEtc`, `#includeFunc`), OpenFOAM 13 header decoration banners, and end-of-file comments, with blank-line separation between dictionary mappings when dumping YAML.

- Standardized floating point scientific notation and numeric list formatting in `majordome-foam` and `majordome.openfoam`: scalars and vectors with extreme magnitudes (`abs < 1e-4` or `abs >= 1e5`) now automatically serialize using standardized 10-decimal scientific notation (`{:.10e}` with standard lowercase `e` and 2-digit signed exponent), eliminating bloated decimal outputs with trailing zeros. Numeric strings within lists are preserved as unquoted scalar tokens on single lines (e.g. polynomial coefficients `CpCoeffs<8>`, `muCoeffs<8>`, `kappaCoeffs<8>`), while retaining double-quoting for true string literals (such as `libs`). Also added sequence formatting support to `FoamDictFile.set(..., fmt=...)`.

- Fixed string list quoting in `majordome-foam` and `majordome.openfoam`: string elements within lists (such as library names in `libs`) are now formatted with double quotes and indented across multiple lines, preventing OpenFOAM lexer token errors. Unquoted keywords in list structures (such as `hex` in `blockMeshDict` blocks) remain unquoted.

- Fixed OpenFOAM dictionary serialization in `majordome-foam` and `majordome.openfoam`: named dictionary entries (e.g. `species Gauss multivariateSelection` in `fvSchemes`) now keep the dictionary name on the same line aligned with other values in the parent dictionary, with the block `{ ... };` cleanly indented below. Furthermore, all nested lists (such as `vertices` and `blocks` in `blockMeshDict`) are now indented with respect to their parent level, preserving canonical OpenFOAM file layout and readability.

- Fixed nested list and sequence serialization in `majordome-foam` and `majordome.openfoam`: replaced 3-element vector length assumptions and incorrect `Compound` handling with uniform, recursive sequence conversion (`FoamValue::List`) and balanced-parenthesis parsing. Sequences across arbitrary dimensions (2D vectors, 3D vectors, tensors, coordinate pairs, nested lists like `levels ((dist0 level0) (dist1 level1));`) now serialize and parse with full parenthesis and type integrity. Also updated `FoamRefinementRegions.add` with type hints, numpydoc docstrings, and single-pair wrapping for distance refinement mode.

- Improved `SutherlandFitting`, notably by type annotations and added `as_openfoam_dict` method (Linux-only) for generating the file required by `chemkinToFoam`.

- Enhanced `FieldFile` and `FoamDictFile` in `majordome.openfoam.files` backed by the Rust crate `majordome-foam` to parse time-step result fields (such as `1/p`), lagrangian cloud data (`1/lagrangian/cloud/T`, `U`, `positions`), and standalone field lists (`constant/cloudPositions`), supporting sequence protocols, `.data` access, and OpenFOAM header metadata properties (`.header`, `.foam_class`, `.location`, `.object`, `.format`). Removed legacy `FoamDataFieldFile` and its subclasses in favor of the unified, high-performance Rust-backed `FieldFile`.

- Added `CalphadStoichiometricSystem.scan_temperature` to tabulate a stoichiometric substance equilibria and thermodynamic properties. Updated documentation to illustrate its use.

- Fixed infinite loop and Python session freeze when accessing OpenFOAM dictionaries containing subdictionaries with stray or double semicolons (such as in `fvSchemes`), and added support for parenthesis-nested key expressions with spaces and in-subdict directives and macros.

- Added helper classes for management of OpenFOAM cases, searchable surfaces, and refinement regions in `majordome.openfoam.files`: `FoamSearchableSurfaces`, and `FoamRefinementRegions`.

- Support creation of OpenFOAM dictionaries on the fly through `FoamCaseHandle`. Handling of parent directory creation is possible. The parent directory is created by default.

- Fixed entry value parsing for nested semicolons (such as multiline `features` lists) and improved formatting for multiline values and comment spacing in `majordome-foam` (documented in `crates/majordome-foam/CHANGELOG.md`).

- Fixed issue related to missing names in `GmshSessionWrapper.save_as_stl` when using `save_full`; see `add_all_groups` for details.

- Added `FoamHelpers.copy_dict_orig` and `FoamHelpers.decompose_simple_coefs` to standardize workflow with a template dictionaries.

- Fixed a bug related to the usage of required groups and introduced dumping to STEP in `majordome.simulation.meshing`. Guarded `self.build()` with `_ensure_built()` in `GmshSessionWrapper` to prevent duplicate geometry builds and preserve face group tags across multiple exports.

- Allow saving all faces into a single STL files in `GmshSessionWrapper` so that alternative workflows can be used for meshing. Also allow skipping session start and improve error handling of required face/volume groups with a decorator method `_require_groups`.

- Suppressed Julia initialization and Pkg activation startup messages in `majordome.auchimiste` environment setup while maintaining `Capturing` stream redirection.

- Creating a prototype to support Julia module wrappers in `majordome.auchimiste` (revival of previous AuChimiste.jl package).

## 1.5.0 - 2026-09-07

- Back to monolithic structure with crates integrated as subtrees of the main project.

- Included module `majordome.openfoam.files` for managing OpenFOAM dictionary and field files. This is a wrapper around `majordome-foam` crate.

- Improved OpenFOAM workflow handling in `majordome.openfoam.run`: fixed file existence check in `dict_expand_field`, improved un-reconstructed parallel restart detection in `FoamHelpers.is_restart`, and added `all_regions` / `region` multi-region reconstruction support to `FoamRunner.reconstruct`.

- Added `dict_expand_field` to `FoamRunner` to enable the expansion of initial conditions in a more convenient and automated way.

- Added `mesh` method to `FoamCleaner` to recursively remove `polyMesh` directories and `cellToRegion` files under `constant/`, and updated `FoamCleaner.case` to accept a `remove_mesh: bool = True` keyword parameter.

- Refactored `GmshOCCModel` to inherit from `GmshSessionWrapper` in `majordome.simulation.meshing`, eliminating code duplication in session lifecycle management, options configuration, and context manager handling.

- Moved all OpenFOAM related utilities to `majordome.openfoam` and added a new module for project management.

- Unified all logic of lazy-exports under the single private module `_imports.py`.

- Support re-exports per OS in `majordome._imports.setup_lazy_exports` to avoid Linux-only code running on other operating systems.

## 1.4.0 - 2026-08-20

- Fixed `Containerfile` and Linux build workflow based on the new project structure.

- Because documentation is under revision, its automatic creation has been disabled in the release script and now requires the `-Docs` switch. This is a temporary measure and will be re-enabled once the documentation is updated.

- Lazy import logic was extended for the core package, so that using `from majordome import ...` works directly for all exported items (currently the Rust wrappers are not exposed as their lazy mechanism is unfinished).

- Added OpenFOAM sample data and examples for illustrating the loading of tabular data using the implementations of `AbstractFoamDataLoader`.

- Documentation of `majordome.simulation` and `majordome.engineering` have been broken down into more manageable blocks. This structure is to be used in other modules in the future.

- Fixed missing re-export of `FoamLagrangianTable` in `majordome.simulation` and minor improvements in the OpenFOAM interfaces.

- Studying a new approach to import Rust modules, starting with `_core.diffusion` which was migrated under `majordome.engineering`.

- Added helper for parsing US drawing number format to `majordome.utilities` as `ArchitecturalFormatUSParser`.

- Support figure `dpi` parameter in `majordome.utilities.plotting.plot_xy` for better configuration of notebooks.

- Moved `majordome.calphad` into `majordome.engineering.calphad` and provided custom re-export of names.

- Removed articles not related from the core project from the documentation and reviewed documents.

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
