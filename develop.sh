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
    if inside_instance; then
        # If from inside apptainer, install package:
        python -m pip install -e .[docs,extras,pdftools,vision]
        sphinx-build -E -b html -c docs/ docs/src/ docs/_build/
        # TODO automate update of containerfile.txt here?
    else
        # Work in a shell within the instance:
        start_instance
        apptainer shell instance://${PROJECT}
    fi
}

develop_majordome
