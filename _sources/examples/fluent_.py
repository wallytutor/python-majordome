# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.18.0
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# # Fluent files

# %load_ext autoreload
# %autoreload 2

from majordome import (
    FluentFvParticlesParser,
    FluentInterpolationParser
)

# ## Parsing particle track files

# Fluent export DPM results in several formats; `majordome` supports *fieldview* particle tracks through `FluentFvParticlesParser`. Loading a file is as simple as:

dpm = FluentFvParticlesParser("data/sample.fvp")

# You can retrieve the names of columns and number of individual tracks with the following properties:

dpm.variable_names, dpm.n_tracks

# For convenience, tracks can be recovered as data frames through object indexing:

dpm[0]

# ## Parsing interpolation files

# Sometimes being able to read and compute new quantites for an interpolation files may be useful, especially in reasearch settings. Class `FluentInterpolationParser` is able to read the contents of an interpolation file exported in plain text format. Below you find an example of parsing.

ip = FluentInterpolationParser("data/sample.ip")

# Names of variables are provided by property `variable_names`:

ip.variable_names

# Valid names can be used to retrieve data for a given variable:

ip.get_data("x0")

# The whole data table can be retreived with `data` property, where each variable correspond to a column:

ip.data
