# !/usr/bin/env bash

# Set project name:
project="majordome"

# Ensure a fresh start:
[[ -f "${project}.tar" ]] && rm -rf "${project}.tar"
[[ -f "${project}.sif" ]] && rm -rf "${project}.sif"

# Configure path to applications:
PODMAN=/usr/bin/podman
APPTAINER=/usr/bin/apptainer

# Avoid the following warning:  WARN[0000] "/" is not a shared mount, this
# could cause issues or missing mounts with rootless containers.
# sudo mount --make-rshared /

# Build the container image:
"${PODMAN}" build -t "${project}" -f "Containerfile" .

# Run the container interactively to test it if necessary:
# "${PODMAN}" run -it "localhost/${project}:latest" /bin/bash

# Dump container to portable .tar file:
"${PODMAN}" save -o "${project}.tar" "localhost/${project}"

# Convert container into apptainer:
"${APPTAINER}" build "${project}.sif" "docker-archive://${project}.tar"

# Remove tar-file:
[[ -f "${project}.tar" ]] && rm -rf "${project}.tar"

# After making sure it is working, remove the image (do not automate!):
# "${PODMAN}" rmi "${project}"