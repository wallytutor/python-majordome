import sys
import pytest

from majordome.simulation import (
    ConstantTimeStepInterval,
    FluentFvParticlesParser,
    GmshOCCModel,
    GmshSessionWrapper,
)

def test_lazy_imports():
    assert ConstantTimeStepInterval is not None
    assert FluentFvParticlesParser is not None
    assert GmshOCCModel is not None
    assert GmshSessionWrapper is not None

def test_gmsh_occ_model_inheritance():
    assert issubclass(GmshOCCModel, GmshSessionWrapper)

    with GmshOCCModel(name="test_domain", render=False) as model:
        assert isinstance(model, GmshSessionWrapper)
        pt_tag = model.add_point(0.0, 0.0, 0.0)
        assert pt_tag > 0


@pytest.mark.skipif(sys.platform != "linux", reason="OpenFOAM runner is Linux-only")
def test_foam_cleaner_mesh(tmp_path):
    from majordome.openfoam.run import FoamCleaner

    case_dir = tmp_path / "test_case"
    constant_dir = case_dir / "constant"
    system_dir = case_dir / "system"
    poly1 = constant_dir / "polyMesh"
    poly2 = constant_dir / "fluid" / "polyMesh"
    cell_file1 = constant_dir / "cellToRegion"
    cell_file2 = constant_dir / "solid" / "cellToRegion"

    poly1.mkdir(parents=True, exist_ok=True)
    poly2.mkdir(parents=True, exist_ok=True)
    system_dir.mkdir(parents=True, exist_ok=True)
    (poly1 / "points").write_text("dummy")
    (poly2 / "points").write_text("dummy")
    (system_dir / "controlDict").write_text("dummy")
    cell_file1.write_text("dummy")
    cell_file2.parent.mkdir(parents=True, exist_ok=True)
    cell_file2.write_text("dummy")

    assert poly1.exists()
    assert poly2.exists()
    assert cell_file1.exists()
    assert cell_file2.exists()

    # Test mesh cleaning directly
    FoamCleaner.mesh(constant_dir)

    assert not poly1.exists()
    assert not poly2.exists()
    assert not cell_file1.exists()
    assert not cell_file2.exists()


@pytest.mark.skipif(sys.platform != "linux", reason="OpenFOAM runner is Linux-only")
def test_foam_cleaner_case_remove_mesh(tmp_path):
    from majordome.openfoam.run import FoamCleaner

    case_dir = tmp_path / "test_case_case"
    constant_dir = case_dir / "constant"
    system_dir = case_dir / "system"
    poly1 = constant_dir / "polyMesh"
    cell_file1 = constant_dir / "cellToRegion"

    poly1.mkdir(parents=True, exist_ok=True)
    system_dir.mkdir(parents=True, exist_ok=True)
    (poly1 / "points").write_text("dummy")
    (system_dir / "controlDict").write_text("dummy")
    cell_file1.write_text("dummy")

    # Default remove_mesh=False should retain polyMesh and cellToRegion
    FoamCleaner.case(case_dir, remove_mesh=False)
    assert poly1.exists()
    assert cell_file1.exists()

    # remove_mesh=True should remove polyMesh and cellToRegion
    FoamCleaner.case(case_dir, remove_mesh=True)
    assert not poly1.exists()
    assert not cell_file1.exists()


