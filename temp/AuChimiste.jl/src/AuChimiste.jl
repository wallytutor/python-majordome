# -*- coding: utf-8 -*-
module AuChimiste

__init__() = nothing

using CairoMakie
using CommonSolve
using DataFrames
using DifferentialEquations
using DocStringExtensions: TYPEDFIELDS
using DynamicQuantities
using Latexify
using ModelingToolkit
using NumericalIntegration
using Pkg.Artifacts
using Polynomials
using Printf
using SciMLBase
using StaticArrays
using Symbolics
using Symbolics: scalarize
using Trapz
using YAML

# For elements:
export has_element
export list_elements
export reset_elements_table
export add_element
export add_isotope
export atomic_mass
export atomic_number
export element_name
export element

# For components:
export component
export stoichiometry
export mole_proportions
export mass_proportions
export stoichiometry_map
export mole_fractions_map
export mass_fractions_map
export quantity

# For physical chemistry:
export mean_molecular_mass_y
export mean_molecular_mass_x
export mean_molecular_mass
export get_mole_fractions
export get_mass_fractions

include("abstract.jl")
include("constants.jl")

#######################################################################
# EXCEPTIONS
#######################################################################

"Element (or isotope) was not found in user database."
struct NoSuchElementError <: ChemicalElementsError
    message::String

    function NoSuchElementError(e)
        return new("""\
            No such element $(e) in the elements dictionary. If you are \
            trying to access an isotope, please make sure you create it \
            before.
            """)
    end
end

"Unstable elements do not provide atomic mass."
struct NoIsotopeProvidedError <: ChemicalElementsError
    message::String

    function NoIsotopeProvidedError(e)
        return new("""\
            Accessing the atomic mass of unstable element $(e) is not \
            supported. Please consider creating a named isotope of \
            this element with `add_isotope`.
            """)
    end
end

"A composition set is missing for the given component."
struct EmptyCompositionError <: ChemicalComponentsError
    message::String

    function EmptyCompositionError()
        return new("""\
            Cannot create a composition with an empty set. Please \
            supply the elements and related amounts accoding to the \
            type of composition specification.
            """)
    end
end

"The provided scaler targets an unspecified element."
struct InvalidScalerError <: ChemicalComponentsError
    message::String

    function InvalidScalerError(s, e)
        return new("""\
            Scaling configuration must be a valid element from the \
            system. Could not find $(s) among $(e).
            """)
    end
end

#######################################################################
# ELEMENTS (API)
#######################################################################

"""
Represents a chemical element.

Fields
======
$(TYPEDFIELDS)
"""
struct AtomicData
    "Element symbol in periodic table."
    symbol::String

    "Element name in periodic table."
    name::String

    "Element number in atomic units."
    number::Int64

    "Element atomic mass [kg/kmol]."
    mass::Float64
end

"""
    has_element(e::Union{String, Symbol})

Check if element exists in list of atomic symbols.
"""
function has_element(e::Union{String, Symbol})
    return haskey(USER_ELEMENTS, Symbol(e))
end

"""
    list_elements()

Provides access to the list of atomic symbols.
"""
function list_elements()
    return Vector{Symbol}([keys(USER_ELEMENTS)...])
end

"""
    reset_elements_table()

Remove any user-defined element.
"""
function reset_elements_table()
    empty!(USER_ELEMENTS)
    merge!(USER_ELEMENTS, ELEMENTS)
    return
end

"""
    add_element(
        symbol::String,
        name::String,
        number::Int64,
        mass::Float64;
        verbose = true
    )

Create chemical element `name` with associated `symbol` and atomic
`number`. The value of atomic `mass` is given in grams per mole.
"""
function add_element(
        symbol::Union{Symbol,String},
        name::String,
        number::Int64,
        mass::Float64;
        verbose = true
    )
    key = Symbol(symbol)

    if haskey(USER_ELEMENTS, key)
        verbose && @warn("""
        The provided element $(key) is already present in the \
        elements dictionary. If you are trying to create an \
        isotope, please chose a different name. Also notice that \
        default stable elements cannot be modified.
        """)
        return
    end

    use_symbol = String(symbol)

    USER_ELEMENTS[key] = AtomicData(use_symbol, name, number, mass)

    return USER_ELEMENTS[key]
end

"""
    add_isotope(
        symbol::String,
        mass::Float64;
        name = nothing,
        verbose = true
    )

Create isotope of element `symbol` with provided `mass` in grams per
mole. If isothope is known by a specific `name` then use it instead
of a *name-mass* naming scheme.
"""
function add_isotope(
        symbol::Union{Symbol,String},
        mass::Float64;
        name = nothing,
        verbose = true
    )
    key = Symbol(symbol)

    !haskey(USER_ELEMENTS, key) && throw(NoSuchElementError(key))

    e = USER_ELEMENTS[key]

    iso_mass = convert(Int64, round(mass, RoundNearest))

    iso_symbol = "$(e.symbol)$(iso_mass)"

    iso_name = isnothing(name) ? "$(e.name)-$(iso_mass)" : name

    return add_element(iso_symbol, iso_name, e.number, mass; verbose)
end

@doc """
    atomic_mass(e::AtomicData)
    atomic_mass(e::Union{String,Symbol})

Atomic mass of element [g/mol].
""" atomic_mass

function atomic_mass(e::AtomicData)
    (e.mass < 0.0) && throw(NoIsotopeProvidedError(e.symbol))
    return e.mass
end

function atomic_mass(e::Union{String,Symbol})
    return handle_element(atomic_mass, e)
end

@doc """
    atomic_number(e::AtomicData)
    atomic_number(e::Union{String,Symbol})

Atomic number of element.
""" atomic_number

function atomic_number(e::AtomicData)
    return e.number
end

function atomic_number(e::Union{String,Symbol})
    return handle_element(atomic_number, e)
end

@doc """
    element_name(e::AtomicData)
    element_name(e::Union{String,Symbol})

Element name from atomic symbol.
""" element_name

function element_name(e::AtomicData)
    return e.name
end

function element_name(e::Union{String,Symbol})
    return handle_element(element_name, e)
end

@doc """
    element(e::Int64)
    element(e::Union{String,Symbol})

Element data from symbol or number.
""" element

function element(e::Int64)
    return find_element(e, :number)
end

function element(e::Union{String,Symbol})
    return find_element(String(e), :symbol)
end

#######################################################################
# ELEMENTS (INTERNALS)
#######################################################################

"""
Default table of elements. This table should not be modified by any
internal or external operation. Although it is declared as constant,
that means simply that `ELEMENTS` cannot be attributed to, but the
resulting dictionary may be accidentally modified.
"""
const ELEMENTS = let
    mapping(e) = Symbol(e[1]) => AtomicData(e...)

    data = map(mapping, [
        ("H",  "hydrogen",      1,     1.008),
        ("He", "helium",        2,     4.002602),
        ("Li", "lithium",       3,     6.94),
        ("Be", "beryllium",     4,     9.0121831),
        ("B",  "boron",         5,    10.81),
        ("C",  "carbon",        6,    12.011),
        ("N",  "nitrogen",      7,    14.007),
        ("O",  "oxygen",        8,    15.999),
        ("F",  "fluorine",      9,    18.998403163),
        ("Ne", "neon",         10,    20.1797),
        ("Na", "sodium",       11,    22.98976928),
        ("Mg", "magnesium",    12,    24.305),
        ("Al", "aluminum",     13,    26.9815384),
        ("Si", "silicon",      14,    28.085),
        ("P",  "phosphorus",   15,    30.973761998),
        ("S",  "sulfur",       16,    32.06),
        ("Cl", "chlorine",     17,    35.45),
        ("Ar", "argon",        18,    39.95),
        ("K",  "potassium",    19,    39.0983),
        ("Ca", "calcium",      20,    40.078),
        ("Sc", "scandium",     21,    44.955908),
        ("Ti", "titanium",     22,    47.867),
        ("V",  "vanadium",     23,    50.9415),
        ("Cr", "chromium",     24,    51.9961),
        ("Mn", "manganese",    25,    54.938043),
        ("Fe", "iron",         26,    55.845),
        ("Co", "cobalt",       27,    58.933194),
        ("Ni", "nickel",       28,    58.6934),
        ("Cu", "copper",       29,    63.546),
        ("Zn", "zinc",         30,    65.38),
        ("Ga", "gallium",      31,    69.723),
        ("Ge", "germanium",    32,    72.630),
        ("As", "arsenic",      33,    74.921595),
        ("Se", "selenium",     34,    78.971),
        ("Br", "bromine",      35,    79.904),
        ("Kr", "krypton",      36,    83.798),
        ("Rb", "rubidium",     37,    85.4678),
        ("Sr", "strontium",    38,    87.62),
        ("Y",  "yttrium",      39,    88.90584),
        ("Zr", "zirconium",    40,    91.224),
        ("Nb", "nobelium",     41,    92.90637),
        ("Mo", "molybdenum",   42,    95.95),
        ("Tc", "technetium",   43,    -1.0),
        ("Ru", "ruthenium",    44,   101.07),
        ("Rh", "rhodium",      45,   102.90549),
        ("Pd", "palladium",    46,   106.42),
        ("Ag", "silver",       47,   107.8682),
        ("Cd", "cadmium",      48,   112.414),
        ("In", "indium",       49,   114.818),
        ("Sn", "tin",          50,   118.710),
        ("Sb", "antimony",     51,   121.760),
        ("Te", "tellurium",    52,   127.60 ),
        ("I",  "iodine",       53,   126.90447),
        ("Xe", "xenon",        54,   131.293),
        ("Cs", "cesium",       55,   132.90545196),
        ("Ba", "barium",       56,   137.327),
        ("La", "lanthanum",    57,   138.90547),
        ("Ce", "cerium",       58,   140.116),
        ("Pr", "praseodymium", 59,   140.90766),
        ("Nd", "neodymium",    60,   144.242),
        ("Pm", "promethium",   61,    -1.0),
        ("Sm", "samarium",     62,   150.36),
        ("Eu", "europium",     63,   151.964),
        ("Gd", "gadolinium",   64,   157.25),
        ("Tb", "terbium",      65,   158.925354),
        ("Dy", "dysprosium",   66,   162.500),
        ("Ho", "holmium",      67,   164.930328),
        ("Er", "erbium",       68,   167.259),
        ("Tm", "thulium",      69,   168.934218),
        ("Yb", "ytterbium",    70,   173.045),
        ("Lu", "lutetium",     71,   174.9668),
        ("Hf", "hafnium",      72,   178.49),
        ("Ta", "tantalum",     73,   180.94788),
        ("W",  "tungsten",     74,   183.84),
        ("Re", "rhenium",      75,   186.207),
        ("Os", "osmium",       76,   190.23 ),
        ("Ir", "iridium",      77,   192.217),
        ("Pt", "platinum",     78,   195.084),
        ("Au", "gold",         79,   196.966570),
        ("Hg", "mercury",      80,   200.592),
        ("Tl", "thallium",     81,   204.38),
        ("Pb", "lead",         82,   207.2 ),
        ("Bi", "bismuth",      83,   208.98040),
        ("Po", "polonium",     84,    -1.0),
        ("At", "astatine",     85,    -1.0),
        ("Rn", "radon",        86,    -1.0),
        ("Fr", "francium",     87,    -1.0),
        ("Ra", "radium",       88,    -1.0),
        ("Ac", "actinium",     89,    -1.0),
        ("Th", "thorium",      90,   232.0377),
        ("Pa", "protactinium", 91,   231.03588),
        ("U",  "uranium",      92,   238.02891),
        ("Np", "neptunium",    93,    -1.0),
        ("Pu", "plutonium",    94,    -1.0),
        ("Am", "americium",    95,    -1.0),
        ("Cm", "curium",       96,    -1.0),
        ("Bk", "berkelium",    97,    -1.0),
        ("Cf", "californium",  98,    -1.0),
        ("Es", "einsteinium",  99,    -1.0),
        ("Fm", "fermium",      100,   -1.0),
        ("Md", "mendelevium",  101,   -1.0),
        ("No", "nobelium",     102,   -1.0),
        ("Lr", "lawrencium",   103,   -1.0),
        ("Rf", "rutherfordium",104,   -1.0),
        ("Db", "dubnium",      105,   -1.0),
        ("Sg", "seaborgium",   106,   -1.0),
        ("Bh", "bohrium",      107,   -1.0),
        ("Hs", "hassium",      108,   -1.0),
        ("Mt", "meitnerium",   109,   -1.0),
        ("Ds", "darmstadtium", 110,   -1.0),
        ("Rg", "roentgenium",  111,   -1.0),
        ("Cn", "copernicium",  112,   -1.0),
        ("Nh", "nihonium",     113,   -1.0),
        ("Gl", "flerovium",    114,   -1.0),
        ("Mc", "moscovium",    115,   -1.0),
        ("Lv", "livermorium",  116,   -1.0),
        ("Ts", "tennessine",   117,   -1.0),
        ("Og", "oganesson",    118,   -1.0),
    ])

    Dict(data)
end

"""
Runtime modifiable table of elements. All operations must be performed
in this table so that user-defined elements (isothopes) can be made
available. This is the table to be internally modified and read by all
functions requiring to access data.
"""
const USER_ELEMENTS = deepcopy(ELEMENTS)

"""
    handle_element(f, e)

Applies function `f` to element `e`. This function wraps the call of
`f` with a standardized error-handling used accross the module.
"""
function handle_element(f, e)
    e = (e isa String) ? Symbol(e) : e
    !has_element(e) && throw(NoSuchElementError(e))
    return f(USER_ELEMENTS[e])
end

"""
    find_element(v, prop)

Find element for which property `prop` has value `v`.
"""
function find_element(v, prop)
    selector(kv) = getproperty(kv[2], prop) == v
    return filter(selector, USER_ELEMENTS) |> values |> first
end

#######################################################################
# COMPONENTS (API)
#######################################################################

"""
Represents a chemical component.

Fields
======
$(TYPEDFIELDS)

Notes
=====

- This structure is not intended to be called as a constructor,
  safe use of its features require using [`component`](@ref)
  construction in combination with a composition specification.

- The array of elements is unsorted when construction is performed
  through [`component`](@ref) but may get rearranged when composing
  new chemical components through supported algebra.

- Care must be taken when using `molar_mass` because it is given
  for the associated coefficients. That is always the expected
  behavior for molecular components but might not be the case in
  other applications (solids, solutions) when the mean molecular
  mass may be required.
"""
struct ChemicalComponent
    "Array of component symbols."
    elements::Vector{Symbol}

    "Array of stoichiometric coefficients."
    coefficients::Vector{Float64}

    "Array of elemental mole fractions."
    mole_fractions::Vector{Float64}

    "Array of elemental mass fractions."
    mass_fractions::Vector{Float64}

    "Molar mass of corresponding stoichiometry."
    molar_mass::Float64

    "Global charge of component."
    charge::Number
end

"""
Represents a quantity of component.

Fields
======
$(TYPEDFIELDS)
"""
struct ComponentQuantity
    "Mass of component in arbitrary units."
    mass::Float64

    "Elemental composition of component."
    composition::ChemicalComponent
end

"""
Provides specification of allowed chemical composition types, which
are used to declare compositions in terms of one of the following
specification methods:

- `Stoichiometry`: stoichiometric coefficients
- `MoleProportion`: molar proportions of elements
- `MassProportion`: mass proportions of elements
"""
@enum CompositionTypes begin
    Stoichiometry
    MoleProportion
    MassProportion
end

"""
Creates a typed composition specification for later construction of
chemical component with [`component`](@ref). Generally the end-user
is not expected to use this structure directly, wrappers being
provided by the available composition types through functions
[`stoichiometry`](@ref), [`mole_proportions`](@ref), and
[`mass_proportions`](@ref).

Fields
======
$(TYPEDFIELDS)
"""
struct Composition{T}
    "Tuple of elements and their amounts."
    data::NamedTuple

    "Scaler element and coefficient for construction of component."
    scale::Pair{Symbol,<:Number}

    function Composition{T}(;
            scale::Union{Nothing, Pair{Symbol, <:Number}} = nothing,
            kw...
        ) where T
        # Empty composition keywords is unacceptable:
        isempty(kw) && throw(EmptyCompositionError())

        # Handle absence of scaling for generality:
        scale = something(scale, first(kw))

        # Enforce type of data (no duplicates!)
        data = NamedTuple(kw)

        # Validate existence of scaling element:
        let
            scaler = scale.first
            elements = keys(data)

            scaler in elements || begin
                throw(InvalidScalerError(scaler, elements))
            end
        end

        # Create and return object:
        return new{T}(data, scale)
    end
end

@doc """
    component(spec; kw...)
    component(c::Composition{Stoichiometry}, charge)
    component(c::Composition{MoleProportion}, charge)
    component(c::Composition{MassProportion}, charge)
    component(c::Dict, charge)

Compile component from given composition specification. This function
is a wrapper eliminating the need of calling [`stoichiometry`](@ref),
[`mole_proportions`](@ref) or [`mass_proportions`](@ref) directly. The
value of `spec` must be the symbol representing one of their names.

**Note:** the overload supporting a dictionary input is intended only
for parsing database species data; its direct use is discouraged.
""" component

macro component(func, comp, charge)
    quote
        comp  = $(esc(comp))

        # Values that can be retrieved directly from `c`:
        elems = vcat(keys(comp.data)...)
        coefs = vcat(values(comp.data)...)
        W     = atomic_mass.(elems)
        idx   = findfirst(x->x==comp.scale.first, elems)

        # No matter what is the input type, normalize coefficients:
        U     = coefs ./ sum(coefs)

        # Function `f` converts unit and sort arguments
        X, Y = $(func)(U, W)

        coefs = (comp.scale.second / X[idx]) .* X
        M     = coefs' * W

        ChemicalComponent(elems, coefs, X, Y, M, $(esc(charge)))
    end
end

function component(spec::Symbol; charge = 0, kw...)
    valid = [:stoichiometry, :mole_proportions, :mass_proportions]
    spec in valid || error("Invalid composition specification $(spec)")
    c = getfield(AuChimiste, spec)(; kw...)
    return component(c, charge)
end

function component(c::Composition{Stoichiometry}, charge)
    return @component((X, W)->(X, get_mass_fractions(X, W)), c, charge)
end

function component(c::Composition{MoleProportion}, charge)
    return @component((X, W)->(X, get_mass_fractions(X, W)), c, charge)
end

function component(c::Composition{MassProportion}, charge)
    return @component((Y, W)->(get_mole_fractions(Y, W), Y), c, charge)
end

function component(c::Dict)
    # Retrieve charge of component:
    charge = -1get(c, "E", 0)

    # Delete electron from composition:
    haskey(c, "E") && delete!(c, "E")
        
    # Handle electron as species without composition:
    isempty(c) && return
        
    c = NamedTuple(zip(Symbol.(keys(c)), values(c)))
    return component(:stoichiometry; charge = charge, c...)
end

"""
    stoichiometry(; kw...)

Create composition based on elemental stoichiometry.
"""
function stoichiometry(; kw...)
    return Composition{Stoichiometry}(; kw...)
end

"""
    mole_proportions(; scale = nothing, kw...)

Create composition based on relative molar proportions. The main
different w.r.t. [`stoichiometry`](@ref) is the presence of a
scaling factor to correct stoichiometry representation of the
given composition.
"""
function mole_proportions(; scale = nothing, kw...)
    scale = something(scale, first(kw).first => 1.0)
    return Composition{MoleProportion}(; scale, kw...)
end

"""
    mass_proportions(; scale = nothing, kw...)

Create composition based on relative molar proportions. This is
essentially the same thing as [`mole_proportions`](@ref) but in
this case the element keywords are interpreted as being the mass
proportions ofa associated elements.
"""
function mass_proportions(; scale = nothing, kw...)
    scale = something(scale, first(kw).first => 1.0)
    return Composition{MassProportion}(; scale, kw...)
end

"""
    stoichiometry_map(c::ChemicalComponent)

Returns component map of elemental stoichiometry.
"""
function stoichiometry_map(c::ChemicalComponent)
   return NamedTuple(zip(c.elements, c.coefficients))
end

"""
    mole_fractions_map(c::ChemicalComponent)

Returns component map of elemental mole fractions.
"""
function mole_fractions_map(c::ChemicalComponent)
   return NamedTuple(zip(c.elements, c.mole_fractions))
end

"""
    mass_fractions_map(c::ChemicalComponent)

Returns component map of elemental mass fractions.
"""
function mass_fractions_map(c::ChemicalComponent)
   return NamedTuple(zip(c.elements, c.mass_fractions))
end

@doc """
    quantity(c::ChemicalComponent, mass::Float64)
    quantity(spec::Symbol, mass::Float64; kw...)

Creates a quantity of chemical component. It may be explicit, *i.e.*
by providing directly a [`ChemicalComponent`](@ref), or implicit, that
means, by creating a component directly from its chemical composition
and specification method (wrapping [`component`](@ref)).
""" quantity

function quantity(c::ChemicalComponent, mass::Float64)
    return ComponentQuantity(mass, c)
end

function quantity(spec::Symbol, mass::Float64; kw...)
    return quantity(component(spec; kw...), mass)
end

#######################################################################
# PHYSICAL CHEMISTRY (API)
#######################################################################

"""
    mean_molecular_mass(U, W; basis)

Compute mean molecular mass based on given composition data.
"""
function mean_molecular_mass(U, W; basis)
    basis == :mole && return mean_molecular_mass_x(U, W)
    basis == :mass && return mean_molecular_mass_y(U, W)
    error("Unknown composition basis $(basis).")
end

@doc """
    get_mole_fractions(Y, W)
    get_mole_fractions(Y, W, M)

Get mole fractions from mass fractions.
""" get_mole_fractions

function get_mole_fractions(Y, W)
    return mean_molecular_mass_y(Y, W) * @. Y / W
end

function get_mole_fractions(Y, W, M)
    return M * @. Y / W
end

@doc """
    get_mass_fractions(X, W)
    get_mass_fractions(X, W, M)

Get mass fractions from mole fractions.
""" get_mass_fractions

function get_mass_fractions(X, W)
    return (@. X * W) / mean_molecular_mass_x(X, W)
end

function get_mass_fractions(X, W, M)
    return (@. X * W) / M
end

#######################################################################
# PHYSICAL CHEMISTRY (INTERNALS)
#######################################################################

"""
    mean_molecular_mass_y(Y, W)

Mean molecular mass computed from mass fractions.
"""
function mean_molecular_mass_y(Y, W)
    return sum(@. Y / W)^(-1.0)
end

"""
    mean_molecular_mass_x(X, W)

Mean molecular mass computed from mole fractions.
"""
function mean_molecular_mass_x(X, W)
    return sum(@. X * W)
end

#######################################################################
# MODELS
#######################################################################

include("utilities.jl")
include("interfaces.jl")
include("thermodynamics.jl")
include("database.jl")
include("kinetics.jl")
include("reactors.jl")
include("transport.jl")
include("combustion.jl")
include("hardcoded.jl")
include("drummer.jl")
include("extensions.jl")
include("recipes.jl")

end # (module AuChimiste)