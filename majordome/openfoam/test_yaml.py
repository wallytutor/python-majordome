# -*- coding: utf-8 -*-

import tempfile
import unittest
from pathlib import Path

from .files import FoamDictFile
from .yaml import FoamYamlCase, foam_to_yaml, yaml_to_foam


class TestMajordomeFoamYaml(unittest.TestCase):
    """ Test suite for OpenFOAM case conversion to and from YAML. """

    def test_foam_to_yaml_and_yaml_to_foam_roundtrip(self) -> None:
        """ Test roundtrip conversion between case directory and YAML. """
        with tempfile.TemporaryDirectory() as tmpdir:
            src_dir = Path(tmpdir) / "src_case"
            out_yaml = Path(tmpdir) / "case.yaml"
            dst_dir = Path(tmpdir) / "dst_case"

            (src_dir / "system").mkdir(parents=True)
            (src_dir / "0").mkdir(parents=True)
            (src_dir / "constant" / "polyMesh").mkdir(parents=True)

            (src_dir / "system" / "controlDict").write_text(
                """/*--- OpenFOAM ---*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    location    "system";
    object      controlDict;
}
application     icoFoam;
startFrom       startTime;
startTime       0;
stopAt          endTime;
endTime         10;
deltaT          0.005;
writeControl    timeStep;
writeInterval   20;
""",
                encoding="utf-8",
            )

            (src_dir / "0" / "U").write_text(
                """/*--- OpenFOAM ---*/
FoamFile
{
    version     2.0;
    format      volVectorField;
    location    "0";
    object      U;
}
dimensions      [0 1 -1 0 0 0 0];
internalField   uniform (1 0 0);
boundaryField
{
    inlet
    {
        type            fixedValue;
        value           uniform (1 0 0);
    }
}
""",
                encoding="utf-8",
            )

            (src_dir / "constant" / "polyMesh" / "points").write_text(
                "dummy mesh points", encoding="utf-8"
            )

            data = foam_to_yaml(src_dir, output_path=out_yaml)
            self.assertTrue(out_yaml.is_file())
            self.assertIn("system", data)
            self.assertIn("controlDict", data["system"])
            self.assertIn("0", data)
            self.assertIn("U", data["0"])
            self.assertNotIn("constant", data)

            case = FoamYamlCase.from_yaml(out_yaml)
            self.assertEqual(
                case.get("system/controlDict/application"), "icoFoam"
            )
            self.assertEqual(
                case.get(["0", "U", "dimensions"]), [0, 1, -1, 0, 0, 0, 0]
            )

            case.set("system/controlDict/endTime", 25)
            case.to_yaml(out_yaml)

            case.to_case(dst_dir)
            self.assertTrue((dst_dir / "system" / "controlDict").is_file())

            cd = FoamDictFile.from_file(dst_dir / "system" / "controlDict")
            self.assertIn(cd.get("endTime"), (25, "25"))

            # Validate header and decoration comments
            content = (dst_dir / "system" / "controlDict").read_text(
                encoding="utf-8"
            )
            self.assertIn("OpenFOAM: The Open Source CFD Toolbox", content)
            self.assertIn("// * * * * * * * *", content)
            self.assertIn("// *****************", content)

    def test_include_directive_preservation(self) -> None:
        """ Test preservation of include directives in roundtrip. """
        with tempfile.TemporaryDirectory() as tmpdir:
            src_dir = Path(tmpdir) / "case"
            out_yaml = Path(tmpdir) / "case.yaml"
            dst_dir = Path(tmpdir) / "recreated"

            (src_dir / "constant" / "chemistry").mkdir(parents=True)

            # Included sub-file
            (src_dir / "constant" / "chemistry" / "reactions").write_text(
                "species ( H2 O2 H2O );", encoding="utf-8"
            )

            # Main dictionary including the sub-file
            (src_dir / "constant" / "chemistryProperties").write_text(
                """FoamFile
{
    format      ascii;
    class       dictionary;
    location    "constant";
    object      chemistryProperties;
}
chemistryType { solver ode; }
#include "chemistry/reactions"
""",
                encoding="utf-8",
            )

            data = foam_to_yaml(src_dir, output_path=out_yaml)
            self.assertIn("constant", data)
            self.assertIn("chemistryProperties", data["constant"])
            # Included sub-file must NOT be stored as a top-level dictionary
            self.assertNotIn("chemistry", data["constant"])
            self.assertIn(
                "#include", data["constant"]["chemistryProperties"]
            )

            yaml_to_foam(out_yaml, dst_dir)
            recreated_content = (
                dst_dir / "constant" / "chemistryProperties"
            ).read_text(encoding="utf-8")
            self.assertIn('#include "chemistry/reactions"', recreated_content)
            self.assertIn("OpenFOAM: The Open Source CFD Toolbox", recreated_content)

    def test_skip_regex_filtering(self) -> None:
        """ Test regex path filtering in foam_to_yaml. """
        with tempfile.TemporaryDirectory() as tmpdir:
            src_dir = Path(tmpdir) / "case"
            (src_dir / "system").mkdir(parents=True)
            (src_dir / "system" / "controlDict").write_text(
                """FoamFile { version 2.0; format ascii; class dictionary; location "system"; object controlDict; }
application icoFoam;
""",
                encoding="utf-8",
            )
            (src_dir / "system" / "fvSchemes").write_text(
                """FoamFile { version 2.0; format ascii; class dictionary; location "system"; object fvSchemes; }
ddtSchemes { default Euler; }
""",
                encoding="utf-8",
            )

            data = foam_to_yaml(src_dir, skip_regex=r"fvSchemes")
            self.assertIn("controlDict", data["system"])
            self.assertNotIn("fvSchemes", data["system"])

    def test_foam_yaml_case_dictionary_operations(self) -> None:
        """ Test FoamYamlCase dict accessors and path lookup methods. """
        case = FoamYamlCase(
            {"system": {"controlDict": {"application": "simpleFoam"}}}
        )
        self.assertEqual(
            case["system"]["controlDict"]["application"], "simpleFoam"
        )
        self.assertIn("system", case)

        case.set("system/controlDict/writeInterval", 100)
        self.assertEqual(case.get("system/controlDict/writeInterval"), 100)
        self.assertEqual(
            case.get(
                "system/controlDict/nonExistentKey", default="defaultVal"
            ),
            "defaultVal",
        )

        case["constant"] = {}
        self.assertIn("constant", case)

    def test_empty_dimensions_and_quoted_lists(self) -> None:
        """ Test that empty dimensions format as [] and libs are quoted. """
        case_dict = {
            "0": {
                "C3H8": {
                    "FoamFile": {
                        "format": "ascii",
                        "class": "volScalarField",
                        "location": '"0"',
                        "object": "C3H8",
                    },
                    "dimensions": [],
                    "internalField": "uniform 0",
                }
            },
            "system": {
                "controlDict": {
                    "FoamFile": {
                        "format": "ascii",
                        "class": "dictionary",
                        "location": '"system"',
                        "object": "controlDict",
                    },
                    "libs": [
                        "libextendedThermophysicalProperties.so",
                        "libextendedLagrangianParcel.so",
                    ],
                }
            },
        }

        with tempfile.TemporaryDirectory() as tmpdir:
            dst_dir = Path(tmpdir) / "case"
            yaml_to_foam(case_dict, case_dir=dst_dir, verbose=False)

            c3h8_content = (dst_dir / "0" / "C3H8").read_text(encoding="utf-8")
            self.assertIn("dimensions       [];", c3h8_content)

            control_content = (dst_dir / "system" / "controlDict").read_text(
                encoding="utf-8"
            )
            self.assertIn(
                '"libextendedThermophysicalProperties.so"', control_content
            )


if __name__ == "__main__":
    unittest.main()
