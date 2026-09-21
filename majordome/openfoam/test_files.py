# -*- coding: utf-8 -*-

import unittest
from pathlib import Path
from .._core import foam
from .files import (
    BlockMeshDict,
    ControlDict,
    DecomposeParDict,
    FieldFile,
    FoamCaseHandle,
    FoamDictFile,
    FoamRefinementRegions,
    FvSchemes,
    FvSolution,
    NotACaseError,
    SnappyHexMeshDict,
    VolScalarField,
    VolVectorField,
)

TUTORIALS_DIR = (
    Path(__file__).resolve().parents[2] / "docs/data/foam/cases"
)
DANGLING_DIR = (
    Path(__file__).resolve().parents[2] / "docs/data/foam/dangling"
)


class TestMajordomeFoam(unittest.TestCase):
    """ Test suite for OpenFOAM dictionary and field file manipulation. """

    def test_foam_dict_raw_rust_binding(self) -> None:
        """ Test raw Rust binding methods on FoamDict. """
        content = """
        application     simpleFoam;
        startFrom       startTime;
        startTime       0;
        stopAt          endTime;
        endTime         1000;
        deltaT          1;
        writeControl    timeStep;
        writeInterval   50;
        purgeWrite      0;
        writeFormat     ascii;
        writePrecision  6;
        writeCompression off;
        timeFormat      general;
        timePrecision   6;
        runTimeModifiable true;
        functions
        {
            #include "foamFunction"
        }
        """
        dict_obj = foam.FoamDict.parse(content)
        self.assertEqual(dict_obj.get("application"), "simpleFoam")
        self.assertEqual(dict_obj.get("endTime"), 1000)
        self.assertTrue(dict_obj.get("runTimeModifiable"))

        dict_obj.set("endTime", 2000)
        self.assertEqual(dict_obj.get("endTime"), 2000)

        dict_obj.set("solvers/p/tolerance", 1e-6)
        self.assertEqual(dict_obj.get("solvers/p/tolerance"), 1e-6)

        self.assertIn("application", dict_obj)
        self.assertTrue(dict_obj.delete("purgeWrite"))
        self.assertNotIn("purgeWrite", dict_obj)

    def test_to_foam_alignment_and_spacing(self) -> None:
        """ Test canonical Foam formatting alignment and spacing. """
        content = """
        application simpleFoam;
        deltaT 1;
        runTimeModifiable true;
        """
        dict_obj = foam.FoamDict.parse(content)
        foam_str = dict_obj.to_foam()

        lines = [line for line in foam_str.splitlines() if line.strip()]
        self.assertEqual(len(lines), 3)

        self.assertTrue(lines[0].startswith("application        simpleFoam;"))
        self.assertTrue(lines[1].startswith("deltaT             1;"))
        self.assertTrue(lines[2].startswith("runTimeModifiable  true;"))

        raw_lines = foam_str.splitlines()
        self.assertEqual(raw_lines[1], "")
        self.assertEqual(raw_lines[3], "")

    def test_control_dict_wrapper(self) -> None:
        """ Test ControlDict wrapper properties. """
        pitz_control = TUTORIALS_DIR / "01-pitzDaily/system/controlDict"

        if pitz_control.exists():
            cd = ControlDict.from_file(pitz_control)
            self.assertEqual(cd.application, "foamRun")
            self.assertEqual(cd.start_from, "latestTime")
            self.assertEqual(cd.stop_at, "endTime")

            cd.end_time = 500.0
            self.assertEqual(cd.end_time, 500.0)

    def test_fv_schemes_wrapper(self) -> None:
        """ Test FvSchemes wrapper sub-dictionaries. """
        schemes_content = """
        ddtSchemes
        {
            default         steadyState;
            ;
        }
        gradSchemes
        {
            default         Gauss linear;
        }
        divSchemes
        {
            default         none;
            div(phi,U)      bounded Gauss linearUpwind grad(U);;
            div(phi, U)     Gauss linear;
        }
        """
        schemes = FvSchemes.parse(schemes_content)
        self.assertEqual(schemes.ddt_schemes.get("default"), "steadyState")
        self.assertEqual(schemes.grad_schemes.get("default"), "Gauss linear")
        self.assertEqual(
            schemes.div_schemes.get("div(phi, U)"), "Gauss linear"
        )

        foam_str = schemes.to_foam()
        self.assertIn("div(phi,U)   bounded Gauss linearUpwind grad(U);", foam_str)
        self.assertIn("div(phi, U)  Gauss linear;", foam_str)
        self.assertNotIn('"bounded Gauss linearUpwind grad(U)"', foam_str)
        self.assertNotIn('"Gauss linear"', foam_str)

    def test_quoted_keys_and_unquoted_values(self) -> None:
        """ Test preservation of quoted keys and unquoted values. """
        content = """
        "(wallInternal|wallExternal)"
        {
            type            zeroGradient;
        }

        "(U|k|omega).*"
        {
            solver          smoothSolver;
        }

        "walls.*"
        {
            type            noSlip;
        }

        default             Gauss linear;
        div(phi,U)          bounded Gauss limitedLinearV 1;
        internalField       uniform (0 0 0);
        """
        dict_obj = foam.FoamDict.parse(content)
        keys = dict_obj.keys()
        self.assertIn('"(wallInternal|wallExternal)"', keys)
        self.assertIn('"(U|k|omega).*"', keys)
        self.assertIn('"walls.*"', keys)
        self.assertIn('div(phi,U)', keys)

        foam_str = dict_obj.to_foam()
        self.assertIn('"(wallInternal|wallExternal)"', foam_str)
        self.assertIn('"(U|k|omega).*"', foam_str)
        self.assertIn('"walls.*"', foam_str)
        self.assertIn('default        Gauss linear;', foam_str)
        self.assertIn('div(phi,U)     bounded Gauss limitedLinearV 1;', foam_str)
        self.assertIn('internalField  uniform (0 0 0);', foam_str)
        self.assertNotIn('"Gauss linear"', foam_str)
        self.assertNotIn('"bounded Gauss limitedLinearV 1"', foam_str)
        self.assertNotIn('"uniform (0 0 0)"', foam_str)

    def test_fv_solution_wrapper(self) -> None:
        """ Test FvSolution solver and relaxation factor access. """
        sol_content = """
        solvers
        {
            p
            {
                solver          GAMG;
                tolerance       1e-06;
                relTol          0.01;
            }
        }
        SIMPLE
        {
            nCorrectors     2;
            consistent      yes;
        }
        """
        sol = FvSolution.parse(sol_content)
        self.assertEqual(sol.get("solvers/p/solver"), "GAMG")
        sol.set_solver_option("p", "tolerance", 1e-7)
        self.assertEqual(sol.get("solvers/p/tolerance"), 1e-7)

    def test_snappy_hex_mesh_dict(self) -> None:
        """ Test SnappyHexMeshDict control flags. """
        snappy_content = """
        castellatedMesh true;
        snap            true;
        addLayers       false;
        geometry
        {
            box.obj
            {
                type triSurfaceMesh;
                name box;
            }
        }
        """
        snappy = SnappyHexMeshDict.parse(snappy_content)
        self.assertTrue(snappy.castellated_mesh)
        self.assertTrue(snappy.snap)
        self.assertFalse(snappy.add_layers)

        snappy.add_layers = True
        self.assertTrue(snappy.add_layers)

    def test_block_mesh_dict(self) -> None:
        """ Test BlockMeshDict properties. """
        bm_content = """
        convertToMeters 0.001;
        """
        bm = BlockMeshDict.parse(bm_content)
        self.assertEqual(bm.convert_to_meters, 0.001)

        bm.convert_to_meters = 1.0
        self.assertEqual(bm.convert_to_meters, 1.0)

    def test_decompose_par_dict(self) -> None:
        """ Test DecomposeParDict domain decomposition properties. """
        dec_content = """
        numberOfSubdomains 4;
        method          scotch;
        """
        dec = DecomposeParDict.parse(dec_content)
        self.assertEqual(dec.number_of_subdomains, 4)
        self.assertEqual(dec.method, "scotch")

        dec.number_of_subdomains = 8
        self.assertEqual(dec.number_of_subdomains, 8)

    def test_field_file(self) -> None:
        """ Test generic FieldFile dimensions and boundary conditions. """
        p_content = """
        dimensions      [0 2 -2 0 0 0 0];
        internalField   uniform 0;
        boundaryField
        {
            inlet
            {
                type            zeroGradient;
            }
        }
        """
        field = FieldFile.parse(p_content)
        self.assertEqual(field.dimensions, [0, 2, -2, 0, 0, 0, 0])
        self.assertEqual(field.internal_field, "uniform 0")

        field.dimensions = [1, -1, -2, 0, 0, 0, 0]
        self.assertEqual(field.dimensions, [1, -1, -2, 0, 0, 0, 0])

    def test_foam_case_handle(self) -> None:
        """ Test FoamCaseHandle case exploration and validation. """
        pitz_dir = TUTORIALS_DIR / "01-pitzDaily"

        if pitz_dir.exists():
            case = FoamCaseHandle(root_dir=pitz_dir)
            self.assertTrue(case.is_valid)

            cd = case.controlDict
            self.assertEqual(cd.application, "foamRun")
            self.assertEqual(cd.start_from, "latestTime")

            snappy = case.snappyHexMeshDict
            self.assertIsNotNone(snappy)

            schemes = case.fvSchemes
            self.assertIsNotNone(schemes)
            self.assertEqual(schemes.ddt_schemes.get("default"), "Euler")

            schemes_alias = case.fv_schemes
            self.assertIsNotNone(schemes_alias)

            schemes_dict = case.get_dict("system/fvSchemes")
            self.assertIsNotNone(schemes_dict)

            sol = case.fvSolution
            self.assertIsNotNone(sol)

            p_field = case.p
            self.assertEqual(p_field.dimensions, [0, 2, -2, 0, 0, 0, 0])

        invalid_case = FoamCaseHandle(root_dir=TUTORIALS_DIR)
        self.assertFalse(invalid_case.is_valid)

        with self.assertRaises(NotACaseError):
            _ = invalid_case.controlDict

    def test_vector_data_field_file(self) -> None:
        """ Test FieldFile vector list parsing and mutation. """
        content = """/*--------------------------------*- C++ -*----------------------------------*\\
  =========                 |
  \\\\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\\\    /   O peration     | Website:  https://openfoam.org
    \\\\  /    A nd           | Version:  13
     \\\\/     M anipulation  |
\\*---------------------------------------------------------------------------*/
FoamFile
{
    format      ascii;
    class       vectorField;
    location    "constant";
    object      reactingCloud1Positions;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
(
(0.05 0.05 0.005)
)
// ************************************************************************* //
"""
        vf = FieldFile.from_string(content)
        self.assertEqual(vf.foam_class, "vectorField")
        self.assertEqual(vf.location, "constant")
        self.assertEqual(vf.object, "reactingCloud1Positions")
        self.assertEqual(len(vf), 1)
        self.assertEqual(vf[0], [0.05, 0.05, 0.005])

        vf[0] = (0.1, 0.2, 0.3)
        self.assertEqual(vf[0], [0.1, 0.2, 0.3])

        vf.append((0.4, 0.5, 0.6))
        self.assertEqual(len(vf), 2)
        self.assertEqual(vf[1], [0.4, 0.5, 0.6])

        serialized = vf.to_foam()
        self.assertIn("vectorField", serialized)
        self.assertIn("(0.1 0.2 0.3)", serialized)
        self.assertIn("(0.4 0.5 0.6)", serialized)

        vf_alias = FieldFile(data=[(0.0, 0.0, 0.0)])
        self.assertEqual(len(vf_alias), 1)

    def test_scalar_data_field_file(self) -> None:
        """ Test FieldFile scalar list parsing. """
        content = """FoamFile
{
    format      ascii;
    class       scalarField;
    location    "constant";
    object      diameters;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
3
(
1.5e-05
2.0e-05
3.5e-05
)
// ************************************************************************* //
"""
        sf = FieldFile.from_string(content)
        self.assertEqual(sf.foam_class, "scalarField")
        self.assertEqual(len(sf), 3)
        self.assertEqual(sf[0], 1.5e-05)
        self.assertEqual(sf[2], 3.5e-05)

        sf.append(4.0e-05)
        self.assertEqual(len(sf), 4)

    def test_label_list_data_field_file(self) -> None:
        """ Test FieldFile label list parsing. """
        content = """FoamFile
{
    format      ascii;
    class       labelList;
    location    "constant";
    object      owner;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
3
(
0
1
2
)
// ************************************************************************* //
"""
        lf = FieldFile.from_string(content)
        self.assertEqual(lf.foam_class, "labelList")
        self.assertEqual(len(lf), 3)
        self.assertEqual(lf[0], 0)
        self.assertEqual(lf[2], 2)

    def test_time_step_and_lagrangian_field_files(self) -> None:
        """ Test time directory and Lagrangian cloud field files. """
        pitz_dir = TUTORIALS_DIR / "01-pitzDaily"

        if pitz_dir.exists():
            case = FoamCaseHandle(root_dir=pitz_dir)

            p_file = case.get_dict("1/p")
            self.assertIsInstance(p_file, FieldFile)
            self.assertEqual(len(p_file), 2197)
            self.assertAlmostEqual(p_file[0], 66494.89347, places=4)
            self.assertEqual(p_file.dimensions, [1, -1, -2, 0, 0, 0, 0])

            t_file = case.get_dict("1/lagrangian/cloud/T")
            self.assertIsInstance(t_file, FieldFile)
            self.assertEqual(len(t_file), 1)
            self.assertAlmostEqual(t_file[0], 1908.595286, places=4)

            u_file = case.get_dict("1/lagrangian/cloud/U")
            self.assertIsInstance(u_file, FieldFile)
            self.assertEqual(len(u_file), 1)
            self.assertEqual(u_file[0], [0.0, 0.0, 0.0])

            pos_file = case.get_dict("1/lagrangian/cloud/positions")
            self.assertIsInstance(pos_file, FieldFile)
            self.assertEqual(len(pos_file), 1)
            self.assertEqual(pos_file[0][1], 1098)
            self.assertEqual(pos_file[0][2], 2653)

    def test_foam_case_handle_data_field_detection(self) -> None:
        """ Test cloud field detection in FoamCaseHandle. """
        pitz_dir = TUTORIALS_DIR / "01-pitzDaily"

        if pitz_dir.exists():
            case = FoamCaseHandle(root_dir=pitz_dir)
            pos1 = case.get_dict("constant/cloudPositions")
            self.assertIsInstance(pos1, FieldFile)
            self.assertEqual(len(pos1), 1)

            pos2 = case.cloudPositions
            self.assertIs(pos1, pos2)

    def test_nested_tuples_and_lists_foam_dict(self) -> None:
        """ Test nesting of tuples and lists in FoamDict values. """
        d1 = foam.FoamDict()
        d1.set("levels", [(0.059, 2), (0.118, 1)])
        self.assertEqual(d1.get("levels"), [[0.059, 2], [0.118, 1]])
        expected_levels = "levels\n(\n    (0.059 2)\n    (0.118 1)\n);"
        self.assertIn(expected_levels, d1.to_foam())

        d2 = foam.FoamDict()
        d2.set("levels", ((0.059, 2), (0.118, 1)))
        self.assertEqual(d2.get("levels"), [[0.059, 2], [0.118, 1]])
        self.assertIn(expected_levels, d2.to_foam())

        d3 = foam.FoamDict()
        d3.set("levels", [[0.059, 2], [0.118, 1]])
        self.assertEqual(d3.get("levels"), [[0.059, 2], [0.118, 1]])
        self.assertIn(expected_levels, d3.to_foam())

        d4 = foam.FoamDict()
        d4.set("vector_2d", (0.0, 1.0))
        self.assertEqual(d4.get("vector_2d"), [0.0, 1.0])
        self.assertIn("vector_2d  (0 1);", d4.to_foam())

        d5 = foam.FoamDict()
        d5.set("vector_3d", (0.0, 1.0, 2.0))
        self.assertEqual(d5.get("vector_3d"), [0.0, 1.0, 2.0])
        self.assertIn("vector_3d  (0 1 2);", d5.to_foam())

        d6 = foam.FoamDict()
        d6.set("tensor_9", (1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0))
        self.assertEqual(
            d6.get("tensor_9"),
            [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
        )
        self.assertIn("tensor_9  (1 0 0 0 1 0 0 0 1);", d6.to_foam())

        d7 = foam.FoamDict()
        d7.set("single_pair", (0.059, 2))
        self.assertEqual(d7.get("single_pair"), [0.059, 2])
        self.assertIn("single_pair  (0.059 2);", d7.to_foam())

        parsed = foam.FoamDict.parse(
            "levels ((0.059 2) (0.118 1));\ntwoD (0 1);"
        )
        self.assertEqual(parsed.get("levels"), [[0.059, 2], [0.118, 1]])
        self.assertEqual(parsed.get("twoD"), [0, 1])
        self.assertIn(
            "levels\n(\n    (0.059 2)\n    (0.118 1)\n);",
            parsed.to_foam()
        )

    def test_refinement_regions_helper(self) -> None:
        """ Test FoamRefinementRegions helper for snappyHexMesh. """
        refinement = FoamDictFile()
        FoamRefinementRegions.add(
            parent=refinement,
            name="refinementBurner",
            mode="inside",
            level=3
        )
        FoamRefinementRegions.add(
            parent=refinement,
            name="refinementCylinderTip",
            mode="distance",
            level=[(0.059, 2), (0.118, 1)]
        )
        FoamRefinementRegions.add(
            parent=refinement,
            name="refinementSinglePair",
            mode="distance",
            level=(0.059, 2)
        )

        foam_str = refinement.to_foam()
        self.assertIn("refinementBurner", foam_str)
        self.assertIn("mode   inside;", foam_str)
        self.assertIn("level  3;", foam_str)
        self.assertIn("refinementCylinderTip", foam_str)
        self.assertIn(
            "levels\n    (\n        (0.059 2)\n        (0.118 1)\n    );",
            foam_str
        )
        self.assertIn("refinementSinglePair", foam_str)
        self.assertIn(
            "levels\n    (\n        (0.059 2)\n    );",
            foam_str
        )

    def test_named_dictionary_alignment_and_indentation(self) -> None:
        """ Test alignment and indentation of named subdictionaries. """
        schemes_path = TUTORIALS_DIR / "01-pitzDaily/system/fvSchemes"

        if schemes_path.exists():
            schemes = FvSchemes.from_file(schemes_path)
            foam_str = schemes.to_foam()

            self.assertIn(
                "species                        Gauss multivariateSelection",
                foam_str
            )
            self.assertIn(
                "    species"
                "                        Gauss multivariateSelection\n"
                "    {\n"
                "        O2    limitedLinear01 1;",
                foam_str
            )
            self.assertIn("    };", foam_str)

            # Declare new named dictionary entry
            schemes.set(
                "divSchemes/multivariate",
                "Gauss customScheme\n{\n    specA upwind;\n}"
            )
            updated_str = schemes.to_foam()
            self.assertIn(
                "multivariate                   Gauss customScheme\n"
                "    {\n"
                "        specA upwind;\n"
                "    };",
                updated_str
            )

    def test_block_mesh_dict_indentation(self) -> None:
        """ Test BlockMeshDict block and vertex list formatting. """
        bmd_content = (
            "vertices\n"
            "(\n"
            "    (0 0 0)\n"
            "    (1 0 0)\n"
            "    (1 1 0)\n"
            "    (0 1 0)\n"
            ");\n"
            "blocks\n"
            "(\n"
            "    hex (0 1 2 3 4 5 6 7) (10 10 10) simpleGrading (1 1 1)\n"
            ");\n"
            "edges ();\n"
        )
        parsed = foam.FoamDict.parse(bmd_content)
        foam_str = parsed.to_foam()

        self.assertIn(
            "vertices\n"
            "(\n"
            "    (0 0 0)\n"
            "    (1 0 0)\n"
            "    (1 1 0)\n"
            "    (0 1 0)\n"
            ");",
            foam_str
        )
        self.assertIn(
            "blocks\n"
            "(\n"
            "    hex\n"
            "    (0 1 2 3 4 5 6 7)\n"
            "    (10 10 10)\n"
            "    simpleGrading\n"
            "    (1 1 1)\n"
            ");",
            foam_str
        )
        self.assertIn("edges  ();", foam_str)

    def test_quoted_strings_in_lists(self) -> None:
        """ Test preservation of quotes in string list items. """
        cd = ControlDict()
        cd.libs = [
            "libextendedThermophysicalProperties.so",
            "libextendedLagrangianParcel.so"
        ]
        self.assertEqual(
            cd.libs,
            [
                "libextendedThermophysicalProperties.so",
                "libextendedLagrangianParcel.so"
            ]
        )
        foam_str = cd.to_foam()
        expected = (
            "libs\n"
            "(\n"
            '    "libextendedThermophysicalProperties.so"\n'
            '    "libextendedLagrangianParcel.so"\n'
            ");"
        )
        self.assertIn(expected, foam_str)

        cd2 = ControlDict()
        cd2.libs = ['"libMyCustom.so"']
        self.assertIn('"libMyCustom.so"', cd2.to_foam())
        self.assertNotIn('""libMyCustom.so""', cd2.to_foam())

    def test_numeric_strings_in_lists_not_quoted(self) -> None:
        """ Test unquoted scientific notation in lists. """
        d = FoamDictFile()
        d.set("CpCoeffs<8>", [
            "1.2807359665e+03",
            "8.8141280265e-02",
            "-7.7836924710e-07",
        ])
        foam_str = d.to_foam()
        expected = (
            "CpCoeffs<8>  (1.2807359665e+03 8.8141280265e-02 "
            "-7.7836924710e-07);"
        )
        self.assertIn(expected, foam_str)
        self.assertNotIn('"', foam_str)

    def test_scientific_notation_for_extreme_scalars(self) -> None:
        """ Test scientific notation formatting for very small numbers. """
        d = FoamDictFile()
        d.set("tiny", 2.886776383321853e-29)
        d.set("small", -0.0000002156595924605777)
        d.set("coeffs", [-0.0000002156595924605777, 2.886776383321853e-29])
        foam_str = d.to_foam()

        self.assertIn("tiny    2.8867763833e-29;", foam_str)
        self.assertIn("small   -2.1565959246e-07;", foam_str)
        self.assertIn(
            "coeffs  (-2.1565959246e-07 2.8867763833e-29);",
            foam_str
        )

    def test_set_with_fmt_on_lists(self) -> None:
        """ Test custom float formatting directive on list elements. """
        d = FoamDictFile()
        d.set(
            "polyCoeffs",
            [1280.735966518363, 0.08814128026451938],
            fmt="{:.10e}"
        )
        foam_str = d.to_foam()
        self.assertIn(
            "polyCoeffs  (1.2807359665e+03 8.8141280265e-02);",
            foam_str
        )


class TestDanglingFiles(unittest.TestCase):
    """ Test suite covering representative OpenFOAM tutorial files. """

    def test_dangling_system_control_dictionaries(self) -> None:
        """ Test direct parsing of system configuration dictionaries. """
        if not DANGLING_DIR.exists():
            self.skipTest("Dangling test directory does not exist")

        cd = ControlDict.from_file(DANGLING_DIR / "controlDict")
        self.assertEqual(cd.start_from, "latestTime")
        self.assertIn("regionSolvers", cd.keys())

        schemes = FvSchemes.from_file(DANGLING_DIR / "fvSchemes")
        self.assertIn("ddtSchemes", schemes.keys())
        self.assertIn("gradSchemes", schemes.keys())

        solution = FvSolution.from_file(DANGLING_DIR / "fvSolution")
        self.assertIn("solvers", solution.keys())

        block_mesh = BlockMeshDict.from_file(DANGLING_DIR / "blockMeshDict")
        self.assertEqual(block_mesh.convert_to_meters, 1)

        dec = DecomposeParDict.from_file(DANGLING_DIR / "decomposeParDict")
        self.assertEqual(dec.number_of_subdomains, 4)
        self.assertEqual(dec.method, "hierarchical")

        snappy = SnappyHexMeshDict.from_file(DANGLING_DIR / "snappyHexMeshDict")
        self.assertTrue(snappy.castellated_mesh)

        surf = FoamDictFile.from_file(DANGLING_DIR / "surfaceFeaturesDict")
        self.assertIn("surfaces", surf.keys())

        extrude = FoamDictFile.from_file(DANGLING_DIR / "extrudeMeshDict")
        self.assertIn("constructFrom", extrude.keys())

        quality = FoamDictFile.from_file(DANGLING_DIR / "meshQualityDict")
        self.assertEqual(quality.object, "meshQualityDict")
        self.assertIn("FoamFile", quality.keys())

    def test_dangling_mesh_geometry_field_files(self) -> None:
        """ Test parsing polyMesh geometry and topology files. """
        if not DANGLING_DIR.exists():
            self.skipTest("Dangling test directory does not exist")

        points_file = FieldFile.from_file(DANGLING_DIR / "polyMesh/points")
        self.assertEqual(points_file.foam_class, "vectorField")
        self.assertEqual(len(points_file), 5)
        self.assertEqual(len(points_file[0]), 3)

        cells_file = FieldFile.from_file(DANGLING_DIR / "polyMesh/cells")
        self.assertEqual(cells_file.foam_class, "cellList")
        self.assertEqual(len(cells_file), 5)
        self.assertEqual(len(cells_file[0]), 6)

        neighbour_file = FieldFile.from_file(DANGLING_DIR / "polyMesh/neighbour")
        self.assertEqual(neighbour_file.foam_class, "labelList")
        self.assertEqual(len(neighbour_file), 5)
        self.assertIsInstance(neighbour_file[0], int)

        boundary_file = FoamDictFile.from_file(
            DANGLING_DIR / "polyMesh/boundary"
        )
        self.assertEqual(boundary_file.foam_class, "polyBoundaryMesh")
        self.assertEqual(boundary_file.object, "boundary")
        self.assertTrue(boundary_file._inner.has_field_data())

    def test_dangling_physical_fields(self) -> None:
        """ Test parsing feature-based zero fields (alpha.water, U). """
        if not DANGLING_DIR.exists():
            self.skipTest("Dangling test directory does not exist")

        # alpha.water: empty dimension array [] and #includeEtc directive
        alpha_water = VolScalarField.from_file(
            DANGLING_DIR / "zero/alpha.water"
        )
        self.assertEqual(alpha_water.dimensions, [])
        self.assertEqual(alpha_water.internal_field, "uniform 0.9")
        self.assertIn("inlet", alpha_water.boundary_field.keys())
        self.assertIn("outlet", alpha_water.boundary_field.keys())
        self.assertIn("topAndBottom", alpha_water.boundary_field.keys())
        self.assertIn("wall", alpha_water.boundary_field.keys())

        # U: vector-valued field, missing header location, regex-like grouping,
        # regex patch matching, and $internalField macro reference.
        u = VolVectorField.from_file(DANGLING_DIR / "zero/U")
        self.assertEqual(u.dimensions, [0, 1, -1, 0, 0, 0, 0])
        self.assertEqual(u.internal_field, "uniform (0 0 0)")
        self.assertIsNone(u.location)
        self.assertIn('"(walls|sides)"', u.boundary_field.keys())
        self.assertIn('"outlet.*"', u.boundary_field.keys())
        self.assertEqual(
            u.get("boundaryField/inlet/value"), "$internalField"
        )
        self.assertIn("$internalField", u.to_foam())

    def test_dangling_transport_and_properties(self) -> None:
        """ Test parsing thermodynamic and physical property files. """
        if not DANGLING_DIR.exists():
            self.skipTest("Dangling test directory does not exist")

        comb = FoamDictFile.from_file(DANGLING_DIR / "combustionProperties")
        self.assertIn("laminarFlameSpeed", comb.keys())

        rad = FoamDictFile.from_file(DANGLING_DIR / "radiationProperties")
        self.assertIn("radiationModel", rad.keys())

        phase = FoamDictFile.from_file(DANGLING_DIR / "phaseProperties")
        self.assertIn("phases", phase.keys())

        phys = FoamDictFile.from_file(DANGLING_DIR / "physicalProperties")
        self.assertIn("thermoType", phys.keys())

        g = FoamDictFile.from_file(DANGLING_DIR / "g")
        self.assertEqual(g.get("dimensions"), [0, 1, -2, 0, 0, 0, 0])
        self.assertEqual(g.get("value"), [0, 0, 0])

        zones = FoamDictFile.from_file(DANGLING_DIR / "createZonesDict")
        self.assertIn("inner", zones.keys())

        baffles = FoamDictFile.from_file(DANGLING_DIR / "createBafflesDict")
        self.assertIn("baffles", baffles.keys())

        dyn = FoamDictFile.from_file(DANGLING_DIR / "dynamicMeshDict")
        self.assertIn("mover", dyn.keys())

        con = FoamDictFile.from_file(DANGLING_DIR / "fvConstraints")
        self.assertIn("limitp", con.keys())

        disp = FoamDictFile.from_file(DANGLING_DIR / "pointDisplacement")
        self.assertIn("dimensions", disp.keys())

    def test_dangling_known_limitations(self) -> None:
        """ Test identification of files subject to known parser limits. """
        if not DANGLING_DIR.exists():
            self.skipTest("Dangling test directory does not exist")

        # Files containing unparenthesized adjacent vector sequences
        # e.g. box (minX minY minZ) (maxX maxY maxZ);
        for lim_file in ["createPatchDict", "refineMeshDict", "setFieldsDict"]:
            path = DANGLING_DIR / lim_file
            self.assertTrue(path.exists(), f"Limitation file {lim_file} missing")
            content = path.read_text(encoding="utf-8")
            self.assertIn("(", content)
            self.assertIn(")", content)


if __name__ == "__main__":
    unittest.main()
