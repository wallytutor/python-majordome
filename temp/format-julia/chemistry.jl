##############################################################################
# CHEMISTRY
##############################################################################

export Stoichiometry
export ChemicalCompound
export MassQuantity
export ThermoCompound

export PureWater
export PureAir
export PureMineral

export LaurentPolynomialProperties
export MaierKelleyThermo
export ShomateThermo

export issolid, isliquid, isgas

export element
export atomicmass
export molecularmass
export density
export specific_heat
export enthalpy
export entropy

export disable_thermo_warnings
export enable_thermo_warnings

#############################################################################
# Type signatures
#############################################################################

"Represents a chemical element."
const ElementData = Tuple{String, String, Float64}

"Represents a pair of element symbol and associated amount."
const ElementalQuantity = Pair{Symbol, <:Number}

#############################################################################
# Compose elemental stoichiometries
#############################################################################

"""
Compound stoichiometry for ease of data manipulation.

This type provide a simple interface for declaring chemical compounds from
stable [`ELEMENTS`](@ref) and computing molecular masses. Its main use is
intended for compound creation during parsing of thermodynamic databases.
Below we illustrate the creation of compounds and the *algebra* of creation
of derived compounds.

```jldoctest
julia> al2o3 = Stoichiometry(Al=2, O=3)
Stoichiometry(Pair{Symbol, <:Number}[:Al => 2, :O => 3])

julia> molecularmass(al2o3)
0.1019600768

julia> ca1o1 = Stoichiometry(Ca=1, O=1)
Stoichiometry(Pair{Symbol, <:Number}[:Ca => 1, :O => 1])

julia> c1a2 = ca1o1 + 2 * al2o3
Stoichiometry(Pair{Symbol, <:Number}[:Al => 4, :Ca => 1, :O => 7])

julia> molecularmass(c1a2)
0.25999715360000003
```

Please notice that [`ChemicalCompound`](@ref) creation should be done
as early as possible as Stoichiometry has no state other than the number
of atoms. Its recurrent use may lead to high computational cost for the
evaluation of molecular masses.
"""
struct Stoichiometry
    amounts::Vector{ElementalQuantity}

    function Stoichiometry(qty)
        # catchduplicates(qty) =>
        (qty .|> first |> unique |> length) == length(qty) || begin
            # XXX: the performance of the following is low, it
            # needs to be generalized to use a faster counter.
            names = first.(qty)
            mults = map(k->k=>count(==(k), names), unique(names))
            mults = sort(filter(a->a[2]>1, mults), rev=true, by=x->x[2])
            throw("Quantity keys must unique: $(first(mults))")
        end

        # assertnonnegative(qty) =>
        all(qty .|> last .>= 0) || begin
            negs = first(filter(a->a[2]<0, qty))
            throw("Coefficients must non-negative: $(negs)")
        end

        return new(qty)
    end
end

Stoichiometry(; kw...) = Stoichiometry([k => v for (k, v) in kw])

function Base.:*(c::Number, s::Stoichiometry)::Stoichiometry
    return Stoichiometry(map(x->x[1]=>c*x[2], s.amounts))
end

function Base.:*(s::Stoichiometry, c::Number)::Stoichiometry
    return c * s
end

function Base.:+(a::Stoichiometry, b::Stoichiometry)::Stoichiometry
    da, db = Dict(a.amounts), Dict(b.amounts)
    allkeys = [union(keys(da), keys(db))...]
    return Stoichiometry(map(k->k=>get(da, k, 0)+get(db, k, 0), allkeys))
end

#############################################################################
# Create processed compounds from stoichiometries
#############################################################################

"""
A chemical compound with internal values pre-computed for recurrent use.

```jldoctest
julia> al2o3 = Stoichiometry(Al=2, O=3);

julia> ca1o1 = Stoichiometry(Ca=1, O=1);

julia> CA = ChemicalCompound(ca1o1 + al2o3);

julia> molecularmass(CA)
0.1580370768
```
"""
struct ChemicalCompound
    compound::Stoichiometry
    elements::Vector{Symbol}
    X::Vector{Float64}
    Y::Vector{Float64}
    M::Float64

    function ChemicalCompound(st::Stoichiometry)
        M = 0.0
        A = 0

        n = length(st.amounts)
        elements = Vector{Symbol}(undef, n)
        X, Y = zeros(n), zeros(n)

        for (k, c) in enumerate(st.amounts)
            # Store element for index search.
            e = elements[k] = first(c)

            # Count number of atoms `k`.
            x = X[k] = last(c)

            # Total mass of atoms `k`.
            y = Y[k] = x * atomicmass(e)

            # Cummulative atoms/molecular mass.
            A += x
            M += y
        end

        return new(st, elements, X ./ A, Y ./ M, M)
    end
end

function ChemicalCompound(d::Dict)
    atoms = NamedTuple(zip(Symbol.(keys(d)), values(d)))
    return ChemicalCompound(; atoms...)
end

ChemicalCompound(; kw...) = ChemicalCompound(Stoichiometry(; kw...))

#############################################################################
# Manipulate quantities of matter
#############################################################################

struct MassQuantity
    amounts::Vector{ElementalQuantity}
end

MassQuantity(d::Dict) = MassQuantity([n=>v for (n, v) in d])

function Base.:*(c::Number, s::ChemicalCompound)::MassQuantity
    return MassQuantity(map(Pair, s.elements, c * s.Y))
end

function Base.:*(c::Number, s::MassQuantity)::MassQuantity
    return MassQuantity(map((e)->e.first => c * e.second, s.amounts))
end

Base.:*(s::ChemicalCompound, c::Number)::MassQuantity = c * s

Base.:*(s::MassQuantity, c::Number)::MassQuantity = c * s

function Base.:+(a::MassQuantity, b::MassQuantity)::MassQuantity
    da, db = Dict(a.amounts), Dict(b.amounts)
    allkeys = [union(keys(da), keys(db))...]
    return MassQuantity(map(k->k=>get(da, k, 0)+get(db, k, 0), allkeys))
end

##############################################################################
# Assembly more complex thermo compounds for use with databases
##############################################################################

struct ThermoCompound <: AbstractThermoCompound
    compoundname::String
    displayname::String
    aggregation::String
    datasource::String
    chemical::ChemicalCompound
    thermodynamics::AbstractThermodynamics
end

#############################################################################
# Types check
#############################################################################

issolid(m::AbstractMaterial)  = m isa AbstractSolidMaterial
isliquid(m::AbstractMaterial) = m isa AbstractLiquidMaterial
isgas(m::AbstractMaterial)    = m isa AbstractGasMaterial

issolid(m::ThermoCompound)  = m.aggregation == "solid"
isliquid(m::ThermoCompound) = m.aggregation == "liquid"
isgas(m::ThermoCompound)    = m.aggregation == "gas"

##############################################################################
# MODELS
##############################################################################

"Thermodynamic properties represeted by Laurent polynomials."
struct LaurentPolynomialProperties <: AbstractThermodynamics
    h298::Float64
    s298::Float64
    coefs::Vector{Float64}

    "Polynomial representation of specific heat [J/(kg.K)]."
    c::AbstractPolynomial

    "Polynomial representation of enthalpy [J/kg]."
    h::AbstractPolynomial

    function LaurentPolynomialProperties(h298, s298, coefs;
            units = :mole,
            molar_mass = nothing
        )
        terms = map(p->LaurentPolynomial(p.second, p.first, :T), coefs)

        c = sum(terms)
        h = h298 + integrate(c)
        
        return new(h298, s298, coefs, c, h)
    end
end

#############################################################################
# Other functionalities
#############################################################################

""" Retrieve an element by name. """
element(s::String) = getfield(ELEMENTS, Symbol(s))

#############################################################################
# atomicmass()
#############################################################################

atomicmass(s::Union{String,Symbol}) = element(String(s)) |> atomicmass

atomicmass(e::ElementData) = 0.001e[3]

@doc """ Atomic mass of element [kg/mol]. """ atomicmass

#############################################################################
# molecularmass()
#############################################################################

# Also support elements by aliasing.
molecularmass(s::Union{String,Symbol}) = atomicmass(s)

molecularmass(e::ElementData) = atomicmass(e)

# Using Union{NamedTuple, Base.Pairs}:
molecularmass(nt) = sum(c*atomicmass(s) for (s, c) in pairs(nt))

# For use as molecularmass(; C=2, H=2), etc:
molecularmass(; kw...) = molecularmass(kw)

# Recomended way using Stoichiometry:
molecularmass(s::Stoichiometry) = molecularmass(; s.amounts...)

# Recomended way using ChemicalCompound:
molecularmass(c::ChemicalCompound) = c.M

# Recomended way using ThermoCompound:
molecularmass(c::ThermoCompound) = molecularmass(c.chemical)

@doc """ Molecular mass of compound [kg/mol]. """ molecularmass

#############################################################################
# density()
#############################################################################

density(mat::AbstractMaterial, T, P) = error("Not implemented")

@doc "Evaluates the density of material [kg/m³]." density

##############################################################################
# DUMMY MATERIALS (TODO: deprecate! use database instead!)
##############################################################################

"Simple solid mineral material for illustration purposes."
struct PureMineral <: AbstractSolidMaterial
    ρ::Float64
    h::Polynomial

    function PureMineral(; ρ = 900.0, h = [0, 850.0])
        return new(ρ, Polynomial(h, :T))
    end
end

"Simple implementation of liquid water for illustration purposes."
struct PureWater <: AbstractLiquidMaterial
end

"Simple implementation of pure air for illustration purposes."
struct PureAir <: AbstractGasMaterial
    M::Float64
    h::Polynomial

    function PureAir(; m = nothing, h = nothing)
        m = defaultvalue(m, M_AIR)
        h = defaultvalue(h, [-2.6257123774377e+05, 9.8274248481342e+02,
                              4.9125599795629e-02])
        return new(m, Polynomial(h, :T))
    end
end

molecularmass(mat::PureWater) = 0.018

density(mat::PureMineral, T, P) = mat.ρ

density(mat::PureWater, T, P) = 1.0 / SpecificV(P, T)

density(mat::PureAir, T, P) = (P * mat.M̄) / (RGAS * T)

specific_heat(mat::PureWater, T, P) = 4182.0

enthalpy(mat::PureMineral, T, P) = mat.h(T)

# TODO use clamp or a fallback to use SteamTables value!
enthalpy(mat::PureWater, T, P) = 4182.0T

enthalpy(mat::PureAir, T, P) = mat.h(T)

##############################################################################
# EOF
##############################################################################