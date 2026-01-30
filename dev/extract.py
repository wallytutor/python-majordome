#!/opt/python3.12/bin/ipython -i
from pathlib import Path
from majordome._majordome import su2
import re
import pandas as pd


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

    def tabulate_keys(self) -> pd.DataFrame:
        """ Convert the config data to a DataFrame. """
        entries = sorted(self.cfg_data.keys())
        df = pd.DataFrame({"entry": entries, "status": ""})
        return df


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


HERE = Path(__file__).parent
print(f"Preparing data from {HERE}")

build = HERE / "build"
build.mkdir(exist_ok=True)

tuto = HERE / "tuto"
test = HERE / "test"


cnf = get_cfg_file(HERE)
project = PrepareProjectData(cnf)

with open("sandbox.md", "w") as f:
    f.write("# Config File Entries\n\n")
    f.write(project.tabulate_keys().to_markdown(index=False))

# wd = tuto / "compressible_flow" / "Inviscid_Bump"
# cnf = get_cfg_file(wd)
# data = su2.parse_cfg(str(cnf))



# wd = HERE