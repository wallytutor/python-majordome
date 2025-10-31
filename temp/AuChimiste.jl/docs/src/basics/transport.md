# Transport

```@setup getting-started-1
using AuChimiste
using CairoMakie
```

## Fermi-like viscosity parametrization

```@example getting-started-1
μ = FermiLikeViscosity(1300.0, 1700.0, 1000.0, 0.1, 10)

μ(300.0), μ(2000.0)
```

```@example getting-started-1
T = LinRange(500, 2000, 1000)

fig, ax = AuChimiste.plot(μ, T)
fig
```