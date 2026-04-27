""" Helper script to automate the release of Majordome.

Workflow
--------
1. Do not run if git status is dirty, unless a --force flag is passed.
   This is to prevent accidentally releasing a version with uncommitted
   changes.

2. Accept a version argument passed both to `uv version` and
   `cargo set-version` to update the version in both places. The argument
   can be an explicit version number (e.g. 1.2.3) or a bump type
   (patch, minor, major). `cargo-edit` is installed automatically via
   `cargo install cargo-edit` before the version is updated.

3. Read the version from Cargo.toml and pyproject.toml to make sure they
   are consistent. If a new version was provided, commit the bump with a
   message like "Bump version to {version}", then create and push an
   annotated git tag.

4. Run `uv build --wheel` to build the package (source distributions are
   not supported; clone the repository to build from source). On Windows
   the build is run locally first, then again inside WSL (Ubuntu) for a
   Linux wheel. After all builds succeed a GitHub release is created with
   `gh release create` and the wheels are attached.

5. Generate the docs with `quarto render docs` using a dedicated virtual
   environment (.venv) that has Majordome installed with its [docs] extras
   (ipykernel, jupyter-cache, jupyter-client). QUARTO_PYTHON is set to
   the interpreter of that environment. If rendering succeeds, the docs
   are published with `quarto publish gh-pages --no-prompt --no-browser`.

Publishing to PyPI is done manually to avoid any mistakes.
"""
import argparse
import os
import re
import sys
from pathlib import Path
from subprocess import run, CalledProcessError


class Colors:
    """ ANSI color sequences used by log helpers. """
    RESET = "\033[0m"
    BLUE = "\033[34m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    RED = "\033[31m"
    CYAN = "\033[36m"

    @staticmethod
    def paint(text: str, color: str) -> str:
        return f"{color}{text}{Colors.RESET}"

    @staticmethod
    def step(text: str) -> None:
        print(Colors.paint(text, Colors.CYAN))

    @staticmethod
    def info(text: str) -> None:
        print(Colors.paint(text, Colors.BLUE))

    @staticmethod
    def ok(text: str) -> None:
        print(Colors.paint(text, Colors.GREEN))

    @staticmethod
    def warn(text: str) -> None:
        print(Colors.paint(text, Colors.YELLOW))

    @staticmethod
    def error(text: str) -> None:
        print(Colors.paint(text, Colors.RED))


class Workflow:
    """ Encapsulates the release workflow steps as static methods. """
    @staticmethod
    def check_git_status(force: bool = False) -> None:
        """ Check if git status is clean unless --force is passed. """
        cmd = ["git", "status", "--porcelain"]
        result = run(cmd, capture_output=True, text=True, check=True)

        if result.stdout.strip() and not force:
            Colors.error(
                "Git working directory is dirty. Commit or stash changes. "
                "Use --force to override this check (not recommended)."
            )
            sys.exit(1)

        if result.stdout.strip():
            Colors.warn(
                "Git working directory is dirty. "
                "Proceeding with --force flag."
            )

    @staticmethod
    def get_versions() -> dict:
        """ Read and validate versions from both config files. """
        pattern = r'version\s*=\s*"([^"]+)"'

        def read_version_from_toml(file_path: str) -> str:
            """ Extract version from a TOML file using regex. """
            if not (match := re.search(pattern, Path(file_path).read_text())):
                raise ValueError(f"Could not find version in {file_path}")

            return match.group(1)

        cargo_version = read_version_from_toml("Cargo.toml")
        pyproject_version = read_version_from_toml("pyproject.toml")

        if cargo_version != pyproject_version:
            Colors.error(
                "Version mismatch!\n"
                f"  Cargo.toml .......: {cargo_version}\n"
                f"  pyproject.toml ...: {pyproject_version}"
            )
            sys.exit(1)

        return {"current": cargo_version, "new": None}

    @staticmethod
    def version_update(version: str) -> str:
        """ Update version in both Cargo.toml and pyproject.toml. """
        versions = Workflow.get_versions()
        target_version = versions['current']
        Colors.ok(f"✓ Current version: {versions['current']}")

        if not version:
            Colors.info(f"ℹ No version specified, keeping {target_version}")
            return target_version

        target_version = Workflow._update_versions(version)
        Workflow._commit_version_bump(target_version)
        Workflow._tag_version_if_missing(target_version)
        return target_version

    @staticmethod
    def build_wheel(version: str) -> None:
        """ Build the wheel package. """
        Colors.info("Building wheel package...")

        if sys.platform != "win32":
            Workflow._local_build("Linux")
        else:
            Workflow._local_build("Windows")

            here = Path(__file__).resolve().parent
            wsl_name = "ubuntu"
            wsl_here = Workflow._win_to_wsl(here)

            build_cmd = [
                "wsl",
                "-d", wsl_name,
                "--",
                "bash", "-lc",
                f"source ~/.bashrc && cd {wsl_here} && uv build --wheel"
            ]

            try:
                Colors.info("Running Linux build in WSL...")
                run(build_cmd, check=True)
                Colors.ok("✓ Linux wheel build in WSL succeeded")
            except CalledProcessError as e:
                Colors.error(f"Failed Linux build in WSL: {e}")
                sys.exit(1)

        Workflow._create_github_release(version)

    @staticmethod
    def render_and_publish_docs() -> None:
        """Render and publish documentation."""
        Colors.info("Preparing documentation environment...")

        selected_python = Workflow._ensure_docs_environment()

        env = os.environ.copy()
        env["QUARTO_PYTHON"] = str(selected_python)

        Colors.info(f"QUARTO_PYTHON={selected_python}")

        try:
            run([str(selected_python), "-c", "import majordome"], check=True)
            Colors.ok("✓ Verified Majordome import in Python environment")
        except FileNotFoundError:
            Colors.error(
                "QUARTO_PYTHON does not point to a valid Python executable."
            )
            sys.exit(1)
        except CalledProcessError:
            Colors.error(
                "Majordome is not importable in QUARTO_PYTHON environment. "
                "Install Majordome in that environment before generating docs."
            )
            sys.exit(1)

        Colors.info("Rendering documentation...")

        # Render docs
        try:
            run(["quarto", "render", "docs"], check=True, env=env)
            Colors.ok("✓ Documentation rendered successfully")
        except FileNotFoundError:
            Colors.error("quarto not found in PATH.")
            sys.exit(1)
        except CalledProcessError as e:
            Colors.error(f"Failed to render documentation: {e}")
            sys.exit(1)

        # Publish docs
        Colors.info("Publishing documentation to GitHub Pages...")
        try:
            run([
                "quarto", "publish", "gh-pages",
                "--no-prompt", "--no-browser",
                "docs"
            ], check=True, env=env)
            Colors.ok("✓ Documentation published successfully")
        except CalledProcessError as e:
            Colors.error(f"Failed to publish documentation: {e}")
            sys.exit(1)

    @staticmethod
    def _update_versions(new_version: str) -> str:
        """ Update versions and return the resolved semantic version. """
        # Ensure cargo-edit is available, then update with cargo
        try:
            run(["cargo", "install", "cargo-edit"], check=True)
        except (FileNotFoundError, CalledProcessError) as e:
            Colors.error(f"Failed to install cargo-edit: {e}")
            sys.exit(1)

        request_version = new_version.strip()
        normal_version = request_version.lower()
        Colors.info(f"Updating version using input '{request_version}'...")

        is_bump = normal_version in {"patch", "minor", "major"}
        uv_target = normal_version if is_bump else request_version

        cmd_uv = ["uv", "version", uv_target]
        cmd_cargo = ["cargo", "set-version", uv_target]

        if is_bump:
            cmd_uv.insert(2, "--bump")
            cmd_cargo.insert(2, "--bump")

        try:
            run(cmd_uv, check=True)
        except (FileNotFoundError, CalledProcessError) as e:
            Colors.error(f"Failed to update version with uv: {e}")
            sys.exit(1)

        try:
            run(cmd_cargo, check=True)
        except (FileNotFoundError, CalledProcessError) as e:
            Colors.error(f"Failed to update version with cargo: {e}")
            sys.exit(1)

        post_version = Workflow.get_versions()["current"]
        Colors.ok(f"✓ Version updated to {post_version}")
        return post_version

    @staticmethod
    def _tag_version_if_missing(version: str) -> None:
        """ Create and push a git tag if it does not already exist. """
        check = run(["git", "rev-parse",
                     "-q", "--verify",
                     f"refs/tags/{version}"],
                     capture_output=True, text=True, check=False)

        if check.returncode == 0:
            Colors.warn(f"Tag {version} already exists. Skipping tagging.")
            return

        Colors.info(f"Creating tag {version}...")
        run([
            "git", "tag",
            "-a", version,
            "-m", f"Preparing release of {version}"
        ], check=True)

        run(["git", "push", "origin", "--tags"], check=True)
        Colors.ok(f"✓ Tag {version} created and pushed")

    @staticmethod
    def _commit_version_bump(version: str) -> None:
        """ Commit version bump changes. """
        Colors.info("Committing version bump...")
        run(["git", "add",
             "Cargo.toml",
             "Cargo.lock",
             "pyproject.toml",
             "uv.lock"], check=False)

        run(["git", "commit", "-m", f"Bump version to {version}"],
            check=True)
        Colors.ok("✓ Version bump committed")

    @staticmethod
    def _win_to_wsl(path: Path) -> str:
        """ Convert a Windows path to a WSL path. """
        cmd = ["wsl", "wslpath", str(path.as_posix())]
        result = run(cmd, capture_output=True, text=True, check=True)
        return result.stdout.strip()

    @staticmethod
    def _create_github_release(version: str) -> None:
        """ Create a GitHub release with the built wheels. """
        wheels = list(Path("dist").glob("*.whl"))

        if not wheels:
            Colors.warn("No wheel files found in dist/. Skipping GitHub release.")
            return

        Colors.info(f"Creating GitHub release v{version}...")
        try:
            run(
                ["gh", "release", "create", f"v{version}",
                 *[str(w) for w in wheels],
                 "--generate-notes"],
                check=True
            )
            Colors.ok(f"✓ GitHub release v{version} created")
        except FileNotFoundError:
            Colors.error("gh (GitHub CLI) not found in PATH. Skipping GitHub release.")
        except CalledProcessError as e:
            Colors.error(f"Failed to create GitHub release: {e}")
            sys.exit(1)

    @staticmethod
    def _local_build(name: str) -> None:
        """ Run a local build for the given platform. """
        Colors.info(f"Running local {name} build...")
        try:
            run(["uv", "build", "--wheel"], check=True)
            Colors.ok(f"✓ Local {name} wheel build succeeded")
        except CalledProcessError as e:
            Colors.error(f"Failed local {name} build: {e}")
            sys.exit(1)

    @staticmethod
    def _ensure_docs_environment() -> Path:
        """ Manage environment for documentation. """
        venv_dir = Path(".venv")

        if sys.platform == "win32":
            python_path = venv_dir / "Scripts" / "python.exe"
        else:
            python_path = venv_dir / "bin" / "python"

        if not python_path.exists():
            Colors.info("Creating documentation virtual environment...")
            try:
                run(["uv", "venv", str(venv_dir)], check=True)
                Colors.ok("✓ Documentation virtual environment created")
            except (FileNotFoundError, CalledProcessError) as e:
                Colors.error(f"Failed to create docs environment with uv: {e}")
                sys.exit(1)
        else:
            Colors.info("Reusing existing virtual environment...")

        Colors.info("Installing Majordome into documentation environment...")

        try:
            run(["uv", "pip", "install", "-e", ".[docs]"], check=True)
            # run([str(python_path), "-c",
            #      "from majordome._core import majordome_entrypoint;"
            #      "majordome_entrypoint(['--install-kernel'])"
            #     ], check=True)
            Colors.ok("✓ Majordome[docs] installed in environment")
        except (FileNotFoundError, CalledProcessError) as e:
            Colors.error(f"Failed to install Majordome in environment: {e}")
            sys.exit(1)

        return python_path

    @classmethod
    def run(cls, args: argparse.Namespace) -> None:
        """ Run the full release workflow. """
        Colors.step("=" * 60)
        Colors.step("Majordome Release Workflow")
        Colors.step("=" * 60)

        Colors.step("\n[1/5] Checking git status...")
        cls.check_git_status(force=args.force)
        Colors.ok("✓ Git status check passed")

        Colors.step("\n[2/5] Reading and validating versions...")
        target = cls.version_update(args.version)

        Colors.step("\n[3/5] Building wheel package...")
        cls.build_wheel(target)

        Colors.step("\n[4/5] Generating and publishing documentation...")
        cls.render_and_publish_docs()

        Colors.step("\n" + "=" * 60)
        Colors.ok(f"✓ Release {target} completed successfully!")
        Colors.step("=" * 60)
        Colors.info("\nPublishing to PyPI should be done manually!")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Automate the release of Majordome"
    )
    parser.add_argument(
        "version",
        nargs="?",
        help="Version to release (e.g., 1.0.1) or bump type (patch|minor|major)"
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Force release even if git status is dirty"
    )

    Workflow.run(parser.parse_args())
