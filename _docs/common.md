# majordome.common

## Constants

```{eval-rst}
.. autodata:: majordome.common.DATA
    :annotation:
```

## Type aliases

```{eval-rst}
.. autodata:: majordome.common.CompositionType
    :annotation:

.. autodata:: majordome.common.SolutionLikeType
    :annotation:

.. autodata:: majordome.common.PathLike
    :annotation:

.. autodata:: majordome.common.MaybePath
    :annotation:

.. autoclass:: majordome.common.StateType
    :members:
```

## Utilities

```{eval-rst}
.. autoclass:: majordome.common.AbstractReportable
    :members:

.. autoclass:: majordome.common.ReadTextData
    :members:

.. autoclass:: majordome.common.InteractiveSession
    :members:

.. autoclass:: majordome.common.Capturing
    :members:

.. autoclass:: majordome.common.RelaxUpdate
    :members:

.. autoclass:: majordome.common.StabilizeNvarsConvergenceCheck
    :members:

.. autoclass:: majordome.common.ComposedStabilizedConvergence
    :members:

.. autofunction:: majordome.common.has_program
.. autofunction:: majordome.common.program_path
.. autofunction:: majordome.common.first_in_path
.. autofunction:: majordome.common.normalize_string
.. autofunction:: majordome.common.safe_remove
.. autofunction:: majordome.common.bounds
.. autofunction:: majordome.common.within
.. autofunction:: majordome.common.apply
```

# majordome.energy

## Process setup

```{eval-rst}
.. autoclass:: majordome.energy.CombustionPowerOp
    :members:

.. autoclass:: majordome.energy.CombustionFlowOp
    :members:

.. autoclass:: majordome.energy.CombustionPowerSupply
    :members:
```

## Combustion analysis

```{eval-rst}
.. autoclass:: majordome.energy.CombustionAtmosphereCHON
    :members:

.. autoclass:: majordome.energy.CombustionAtmosphereMixer
    :members:
```

## Energy sources

```{eval-rst}
.. autoclass:: majordome.energy.AbstractEnergySource
    :members:

.. autoclass:: majordome.energy.CanteraEnergySource
    :members:

.. autoclass:: majordome.energy.GasFlowEnergySource
    :members:

.. autoclass:: majordome.energy.HeatedGasEnergySource
    :members:

.. autoclass:: majordome.energy.CombustionEnergySource
    :members:
```

# majordome.fluent

## Handling of exported data files

```{eval-rst}
.. autoclass:: majordome.fluent.FluentFvParticlesParser
    :members:

.. autoclass:: majordome.fluent.FluentInterpolationParser
    :members:
```

## Generation of TSV files

```{eval-rst}
.. autoclass:: majordome.fluent.FluentInputRow
    :members:

.. autoclass:: majordome.fluent.FluentInputFile
    :members:
```

## Parsing Scheme data

```{eval-rst}
.. autoclass:: majordome.fluent.FluentSchemePatch
    :members:

.. autoclass:: majordome.fluent.FluentSchemeHeader
    :members:

.. autoclass:: majordome.fluent.FluentSchemeTableRow
    :members:

.. autoclass:: majordome.fluent.FluentDpmFile
    :members:
```

## Others

```{eval-rst}
.. autofunction:: majordome.fluent.convert_xy_to_dict
.. autofunction:: majordome.fluent.load_dpm_table
```

# majordome.latex

```{eval-rst}
.. autofunction:: majordome.latex.list_tex_templates
.. autofunction:: majordome.latex.load_tex_template
.. autofunction:: majordome.latex.fill_tex_template
```

# majordome.pdftools

```{eval-rst}
.. autoclass:: majordome.pdftools.PdfExtracted
    :members:

.. autoclass:: majordome.pdftools.PdfToTextConverter
    :members:
```


# majordome.reactor

## General utilities

```{eval-rst}
.. autoclass:: majordome.reactor.NormalFlowRate
    :members:
```

```{eval-rst}
.. autofunction:: majordome.reactor.toggle_reactor_warnings
.. autofunction:: majordome.reactor.composition_to_dict
.. autofunction:: majordome.reactor.composition_to_array
.. autofunction:: majordome.reactor.solution_report
.. autofunction:: majordome.reactor.copy_solution
.. autofunction:: majordome.reactor.copy_quantity
```

## Plug-flow reactors (PFR)

```{eval-rst}
.. autoclass:: majordome.reactor.PlugFlowChainCantera
    :members:
```

### PFR utilities

```{eval-rst}
.. autoclass:: majordome.reactor.PlugFlowAxialSources
    :members:

.. autofunction:: majordome.reactor.get_reactor_data
```

# majordome.vision

## General utilities

```{eval-rst}
.. autoclass:: majordome.vision.ImageCrop
    :members:

.. autoclass:: majordome.vision.ChannelSelector
    :members:

.. autoclass:: majordome.vision.ContrastEnhancement
    :members:

.. autoclass:: majordome.vision.ThresholdImage
    :members:

.. autoclass:: majordome.vision.HelpersFFT
    :members:

.. autofunction:: majordome.vision.load_metadata
.. autofunction:: majordome.vision.hyperspy_rgb_to_numpy
```

## Microscopy helpers

```{eval-rst}
.. autoclass:: majordome.vision.AbstractSEMImageLoader
    :members:

.. autoclass:: majordome.vision.HyperSpySEMImageLoaderStub
    :members:

.. autoclass:: majordome.vision.CharacteristicLengthSEMImage
    :members:
```

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

## Radiation properties

```{eval-rst}
.. autoclass:: majordome.transport.WSGGRadlibBordbar2020
    :members:
```

### Internals

```{eval-rst}
.. autoclass:: majordome.transport.AbstractRadiationModel
    :members:

.. autoclass:: majordome.transport.AbstractWSGG
    :members:
```
