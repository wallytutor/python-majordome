#!/usr/bin/env bash

# Set project name:
PROJECT="majordome"

function start_instance() {
    # Create majordome.sif if not found:
    [[ ! -f ${PROJECT}.sif ]] && bash containerfile.sh

    # Activate apptainer instance if not present:
    if ! apptainer instance list | grep -q ${PROJECT}; then
        apptainer instance start --bind $(pwd):/opt/app \
            --writable-tmpfs ${PROJECT}.sif ${PROJECT}
    else
        echo "Apptainer instance '${PROJECT}' already running."
    fi
}

function inside_instance() {
    if [ -n "$APPTAINER_NAME" ] || [ -n "$SINGULARITY_NAME" ]; then
        return 0
    else
        return 1
    fi
}

function develop_majordome() {
    python=$1

    if inside_instance; then
        # If from inside apptainer, install package:
        ${python} -m pip install --upgrade pip
        ${python} -m pip install --upgrade build wheel
        ${python} -m pip install --upgrade setuptools setuptools-rust

        ${python} -m pip install -e .[docs,extras]
        ${python} -m build --wheel --sdist

        # Build documentation (TODO which sphinx-build?):
        # sphinx-build -E -b html -c docs/ docs/src/ docs/_build/
        # TODO automate update of containerfile.txt here?
    else
        # Work in a shell within the instance:
        start_instance
        apptainer shell instance://${PROJECT}
    fi
}

# XXX: for Python3.14 see notes on Containerfile:
develop_majordome '/opt/python3.12/bin/python3.12'
develop_majordome '/opt/python3.13/bin/python3.13'
# develop_majordome '/opt/python3.14/bin/python3.14'