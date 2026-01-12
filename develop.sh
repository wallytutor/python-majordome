#!/usr/bin/env bash

# Get the directory where this script is located:
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure script runs from its own directory:
cd "${SCRIPT_DIR}" || {
    echo "Error: Cannot change to script directory: ${SCRIPT_DIR}" >&2
    exit 1
}

# Set project name:
PROJECT="majordome"

# Set context directory for building the container:
CONTEXT="${SCRIPT_DIR}/src/configuration"

# Configure path to applications:
CONTAINER=/usr/bin/podman
APPTAINER=/usr/bin/apptainer

function create_image() {
    # Avoid the following warning:  WARN[0000] "/" is not a shared mount,
    # this could cause issues or missing mounts with rootless containers.
    # sudo mount --make-rshared /

    # Ensure a fresh start:
    # [[ -f "${PROJECT}.tar" ]] && rm -rf "${PROJECT}.tar"
    # [[ -f "${PROJECT}.sif" ]] && rm -rf "${PROJECT}.sif"

    # Build the container image:
    "${CONTAINER}" build \
        -t "${PROJECT}" \
        -f "${CONTEXT}/Containerfile" "${CONTEXT}"

    # Run the container interactively to test it if necessary:
    # "${CONTAINER}" run -it "localhost/${PROJECT}:latest" /bin/bash

    # Dump container to portable .tar file:
    "${CONTAINER}" save -o "${PROJECT}.tar" "localhost/${PROJECT}"

    # Convert container into apptainer:
    "${APPTAINER}" build "${PROJECT}.sif" "docker-archive://${PROJECT}.tar"

    # Remove tar-file:
    [[ -f "${PROJECT}.tar" ]] && rm -rf "${PROJECT}.tar"

    # After making sure it is working, remove the image (do not automate!):
    # "${PODMAN}" rmi "${PROJECT}"
}

function start_instance() {
    # Create majordome.sif if not found:
    [[ ! -f "${PROJECT}.sif" ]] && create_image

    # Activate apptainer instance if not present:
    if ! ${APPTAINER} instance list | grep -q ${PROJECT}; then
        ${APPTAINER} instance start --bind $(pwd):/opt/app \
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

function run_majordome_build() {
    python=$1
    ${python} -m pip install -e .[docs,extras]
    ${python} -m build --wheel --sdist
    # Build documentation (TODO which sphinx-build?):
    # sphinx-build -E -b html -c docs/ docs/src/ docs/_build/
    # TODO automate update of containerfile.txt here?
}

function develop_majordome() {
    if inside_instance; then
        # If from inside apptainer, install package:
        # XXX: for Python3.14 see notes on Containerfile:
        run_majordome_build '/opt/python3.12/bin/python3.12'
        run_majordome_build '/opt/python3.13/bin/python3.13'
        # run_majordome_build '/opt/python3.14/bin/python3.14'

    else
        # Work in a shell within the instance:
        start_instance
        ${APPTAINER} shell instance://${PROJECT}
    fi
}

develop_majordome
