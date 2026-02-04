#!/opt/python3.12/bin/ipython -i
from pathlib import Path
from majordome._majordome import su2
import re
import pandas as pd
import yaml


class PrepareProjectData:
    """ Helper for organizing project data extraction. """
    def __init__(self, cfg_path: Path):
        self.cfg_path = cfg_path
        self.cfg_data = su2.parse_cfg(str(cfg_path))
        self.sections = self.get_cfg_ref_sections(cfg_path)

    @staticmethod
    def extract_text(s):
        """ Extract the uppercase text from a string. """
        if match := re.search(r'[A-Z][A-Z ,\-/]+[A-Z]', s, re.IGNORECASE):
            return match.group(0).strip()
        return s.strip()

    def get_cfg_ref_sections(self, template: Path) -> list[str]:
        """ Extract the sections from the config template file. """
        sections = []

        with open(template) as f:
            for line in f.readlines():
                if line.startswith("% --"):
                    sections.append(line.strip())

        sections = list(map(self.extract_text, sections))

        # There are some sub-sections (using lowercase letters), filter them
        # out as we only want the main sections.
        return list(filter(lambda s: not s.startswith("%"), sections))

    def tabulate_keys(self, sort=False) -> pd.DataFrame:
        """ Convert the config data to a DataFrame. """
        entries = self.cfg_data.keys()

        if sort:
            entries = sorted(entries)

        return pd.DataFrame({"entry": entries, "status": ""})


def get_cfg_file(case_path: Path) -> Path:
    """ Get the .cfg file in the given case path. """
    cnf = list(case_path.glob("*.cfg"))

    match len(cnf):
        case 0:
            raise FileNotFoundError(f"No .cfg file found in {case_path}")
        case 1:
            pass
        case _:
            raise RuntimeError(f"Expected one .cfg in {case_path}, found {cnf}")

    return cnf[0]


def get_cfg_maps() -> dict:
    """ Gets the mapping of sections and entries.

    Before this can be used, the first time a "config.yaml" file needs
    to be created. This can be done by running the following code once.
    Save the list of entries to a YAML file the first time (will need
    manual categorization later).

    cnf = get_cfg_file(HERE)
    project = PrepareProjectData(cnf)

    with open("sandbox-config.yaml", "w") as f:
       yaml.dump({"entries": list(project.cfg_data.keys())}, f)
    """
    with open("config.yaml") as f:
        config = yaml.safe_load(f)

    config["reverse"] ={}

    for section, entries in config["sections"].items():
        for entry in entries:
            if entry in config["reverse"]:
                raise RuntimeError(f"Entry {entry} already assigned to "
                                f"section {config['reverse'][entry]}")

            config["reverse"][entry] = section

    return config


HERE = Path(__file__).parent
print(f"Preparing data from {HERE}")

build = HERE / "build"
build.mkdir(exist_ok=True)

tuto = HERE / "tuto"
test = HERE / "test"

config = get_cfg_maps()

cases = {
    "compressible_flow/Inviscid_Bump": {
        "config": "inv_channel.cfg",
    },
    "compressible_flow/Inviscid_Wedge": {
        "config": "inv_wedge_HLLC.cfg",
    },
    "compressible_flow/Inviscid_ONERAM6": {
        "config": "inv_ONERAM6.cfg",
    },
    # "compressible_flow/ActuatorDisk_VariableLoad",
    # "compressible_flow/Laminar_Cylinder",
    # "compressible_flow/Laminar_Flat_Plate",
    # "compressible_flow/NICFD_nozzle",
    # "compressible_flow/QuickStart",
    # "compressible_flow/Transitional_Airfoil",
    # "compressible_flow/Transitional_Flat_Plate",
    # "compressible_flow/Turbulent_Flat_Plate",
    # "compressible_flow/Turbulent_ONERAM6",
    # "compressible_flow/Unsteady_NACA0012",
    # "compressible_flow/UQ_NACA0012",
    # "design/Inc_Turbulent_Bend_Wallfunctions",
    # "design/Inviscid_2D_Unconstrained_NACA0012",
    # "design/Inviscid_3D_Constrained_ONERAM6",
    # "design/Multi_Objective_Shape_Design",
    # "design/Species_Transport",
    # "design/Turbulent_2D_Constrained_RAE2822",
    # "design/Unsteady_Shape_Opt_NACA0012",
    # "incompressible_flow/Inc_Combustion",
    # "incompressible_flow/Inc_Inviscid_Hydrofoil",
    # "incompressible_flow/Inc_Laminar_Cavity",
    # "incompressible_flow/Inc_Laminar_Flat_Plate",
    # "incompressible_flow/Inc_Laminar_Step",
    # "incompressible_flow/Inc_Species_Transport",
    # "incompressible_flow/Inc_Species_Transport_Composition_Dependent_Model",
    # "incompressible_flow/Inc_Streamwise_Periodic",
    # "incompressible_flow/Inc_Transitional_Prolate_Spheroid",
    # "incompressible_flow/Inc_Turbulent_Bend_Wallfunctions",
    # "incompressible_flow/Inc_Turbulent_Flat_Plate",
    # "incompressible_flow/Inc_Turbulent_NACA0012",
    # "incompressible_flow/Inc_Von_Karman_Cylinder",
    # "multiphysics/contact_resistance_cht",
    # "multiphysics/steady_cht",
    # "multiphysics/steady_fsi",
    # "multiphysics/unsteady_cht",
    # "multiphysics/unsteady_fsi_python",
    # "structural_mechanics/cantilever",
    # "multiphysics/unsteady_fsi_python/Ma01",
    # "multiphysics/unsteady_fsi_python/Ma02",
    # "multiphysics/unsteady_fsi_python/Ma03",
    # "multiphysics/unsteady_fsi_python/Ma0357",
    # "multiphysics/unsteady_fsi_python/Ma0364",
    # "incompressible_flow/Inc_Combustion/1__premixed_hydrogen",
    # "incompressible_flow/Inc_Species_Transport/1__FFD-box-writing",
    # "incompressible_flow/Inc_Species_Transport/2__mesh-deform-test",
    # "incompressible_flow/Inc_Species_Transport/3__gradient-validation",
    # "incompressible_flow/Inc_Species_Transport/4__optimization",
    # "compressible_flow/NICFD_nozzle/DataDriven",
    # "compressible_flow/NICFD_nozzle/PhysicsInformed",
    # "compressible_flow/QuickStart/adj",
    # "compressible_flow/QuickStart/dadj",
    # "compressible_flow/Transitional_Airfoil/Langtry_and_Menter",
    # "compressible_flow/Transitional_Flat_Plate/Langtry_and_Menter",
    # "compressible_flow/Transitional_Flat_Plate/Langtry_and_Menter/T3A",
    # "compressible_flow/Transitional_Flat_Plate/Langtry_and_Menter/T3A-",
    # "compressible_flow/Transitional_Airfoil/Langtry_and_Menter/E387",
    # "compressible_flow/Transitional_Airfoil/Langtry_and_Menter/NLF",
}

all_keys = []

for tuto_case, data in cases.items():
    cfg = tuto / Path(tuto_case) / data["config"]
    dat = su2.parse_cfg(str(cfg))
    all_keys.extend(list(dat.keys()))

all_keys = sorted(set(all_keys))
all_sections = sorted(set(config["reverse"][key] for key in all_keys))

# with open("sandbox-sections.md", "w") as f:
#     f.write("# Config File Entries\n\n")
#     f.write(project.tabulate_keys().to_markdown(index=False))

# wd = tuto / "compressible_flow" / "Inviscid_Bump"
# cnf = get_cfg_file(wd)
# data = su2.parse_cfg(str(cnf))