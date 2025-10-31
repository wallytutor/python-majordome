# -*- coding: utf-8 -*-

function Base.show(io::IO, e::AtomicData)
    print(io, "$(e.symbol) ($(e.number), $(e.name)) $(e.mass) kg/kmol")
end

function Base.show(io::IO, err::ChemicalException)
    print(io, "$(nameof(typeof(err))): $(err.message)")
end

function Base.showerror(io::IO, err::ChemicalException)
    Base.show(io, err)
end

function Base.show(io::IO, obj::DrumMediumKramersSolution)
    τ = @sprintf("%.1f", obj.τ[end] / 60.0)
    η = @sprintf("%.2f", obj.Η)
    print(io, "DrumMediumKramersSolution(τ = $(τ) min, η = $(η) %)")
end

function Base.:*(scale::Number, comp::ChemicalComponent)::ChemicalComponent
    newcomp = zip(comp.elements, scale * comp.coefficients)
    newchrg = scale * comp.charge
    return component(:stoichiometry; charge = newchrg, newcomp...)
end

function Base.:*(comp::ChemicalComponent, scale::Number)::ChemicalComponent
    return scale * comp
end

function Base.:+(ca::ChemicalComponent, cb::ChemicalComponent)::ChemicalComponent
    elements = sort(union(ca.elements, cb.elements))

    # TODO: this is probably faster and more readable than using an
    # index look-up approach, but I need to test that too because
    # it avoids creating intermediate elements (memory footprint).
    da = Dict(zip(ca.elements, ca.coefficients))
    db = Dict(zip(cb.elements, cb.coefficients))

    f(e) = get(da, e, 0.0) + get(db, e, 0.0)
    newcomp = map(e->Pair(e, f(e)), elements)

    charge = ca.charge + cb.charge

    return component(:stoichiometry; charge, newcomp...)
end

function Base.:-(ca::ChemicalComponent, cb::ChemicalComponent)::ChemicalComponent
    tmp = ca + (-1cb)

    if any(tmp.coefficients .< 0)
        @warn("""\
              Component subtraction is fragile and must be used with care. \
              The component operation you tried to perform produced negative \
              coefficients. That is because the right component have more of \
              one/some elements than the left component. Instead of retuning \
              the meaningless composition I am providing you with the mass \
              imbalance.
              """)

        cmp = Tuple(zip(tmp.elements, tmp.coefficients))
        newcomp = map(p->p[1]=>-1p[2], filter(p->last(p) < 0, cmp))
        return component(:stoichiometry; newcomp...)
    end

    return tmp
end

function Base.:*(scale::Number, qty::ComponentQuantity)
    return ComponentQuantity(scale * qty.mass, qty.composition)
end

function Base.:*(qty::ComponentQuantity, scale::Number)
    return scale * qty
end

function Base.:+(qa::ComponentQuantity, qb::ComponentQuantity)
    ma, mb = qa.mass, qb.mass
    mass = ma + mb

    ca, cb = qa.composition, qb.composition
    elements = sort(union(ca.elements, cb.elements))

    # TODO: this is probably faster and more readable than using an
    # index look-up approach, but I need to test that too because
    # it avoids creating intermediate elements (memory footprint).
    da = Dict(zip(ca.elements, ca.mass_fractions))
    db = Dict(zip(cb.elements, cb.mass_fractions))

    f(e) = ma * get(da, e, 0.0) + mb * get(db, e, 0.0)
    newcomp = map(e->Pair(e, f(e)), elements)

    c = component(:mass_proportions; newcomp...)
    return ComponentQuantity(mass, c)
end
