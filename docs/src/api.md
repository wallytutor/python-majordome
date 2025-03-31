# Majordome API

## majordome.combustion

```{eval-rst}
.. autoclass:: majordome.combustion.analysis.CombustionAtmosphereCHON
	:members:
.. autoclass:: majordome.combustion.analysis.CombustionPowerSupply
	:members:
.. autoclass:: majordome.combustion.analysis.CombustionAtmosphereMixer
	:members:
```

## majordome.simulation

### Fluent

#### Generation of TSV files

```{eval-rst}
.. autoclass:: majordome.simulation.fluent.FluentInputRow
	:members:
.. autoclass:: majordome.simulation.fluent.FluentInputFile
	:members:
```

#### Parsing Scheme data

```{eval-rst}
.. autoclass:: majordome.simulation.fluent.FluentSchemePatch
	:members:
.. autoclass:: majordome.simulation.fluent.FluentSchemeHeader
	:members:
.. autoclass:: majordome.simulation.fluent.FluentSchemeTableRow
	:members:
.. autoclass:: majordome.simulation.fluent.FluentDpmFile
	:members:
```

#### Others

```{eval-rst}
.. autofunction:: majordome.simulation.fluent.convert_xy_to_dict
.. autofunction:: majordome.simulation.fluent.load_dpm_table
```

## majordome.common


### Constants

```{eval-rst}
.. autodata:: majordome.common.T_REFERENCE
    :annotation:
.. autodata:: majordome.common.T_NORMAL
    :annotation:
.. autodata:: majordome.common.P_NORMAL
    :annotation:
```

### Type aliases

```{eval-rst}
.. autodata:: majordome.common.CompositionType
    :annotation:
```
