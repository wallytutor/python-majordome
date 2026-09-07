
using Pkg

Pkg.activate(joinpath(@__DIR__, "majordome", "auchimiste"))

Pkg.add([
    # "CairoMakie",
    # "CommonSolve",
    # "DataFrames",
    # "DifferentialEquations",
    # "DocStringExtensions",
    # "DynamicQuantities",
    # "Latexify",
    # "Makie",
    # "ModelingToolkit",
    # "NumericalIntegration",
    # "PrettyPrinting",
    # "SciCompDSL",
    # "SciMLBase",
    # "StaticArrays",
    # "Symbolics",
    # "Trapz",
    # "Unitful",
    "YAML"
])
