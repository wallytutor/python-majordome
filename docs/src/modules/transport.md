# majordome.transport

## Effective thermal conductivity

In some fields of research, such as porous media or composite materials, the evaluation of effective thermal properties are key for simulation of macroscopic application cases. Class `EffectiveThermalConductivity`  implements thermal conductivity models for this sort of applications, including:

- Maxwell-Garnett approximation ({py:meth}`~majordome.transport.EffectiveThermalConductivity.maxwell_garnett`) as exposed in [@Hanein2017]; further discussion of its origin and applicability is provided by [@Kiradjiev2019].

- For porous media (packed bed in the context) with enhanced radiative effects the model by [@Singh1994] as discussed by [@Kee2017] is implemented  ({py:meth}`~majordome.transport.EffectiveThermalConductivity.singh1994`).

```{eval-rst}
.. autoclass:: majordome.transport.EffectiveThermalConductivity
    :members:
```

## Dimensionless numbers

```{eval-rst}
.. autoclass:: majordome.transport.SolutionDimless
    :members:
```

## Sutherland fitting

```{eval-rst}
.. autoclass:: majordome.transport.SutherlandFitting
    :members:
```
