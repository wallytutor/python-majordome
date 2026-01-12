# bashrc

##############################################################################
# Docker/podman aliases
##############################################################################

dfresh() {
    docker builder prune -a
    docker system prune -a --volumes
}
pfresh() {
    podman builder prune -a
    podman system prune -a --volumes
}

pls() { podman images -a; }
dls() { docker images -a; }

drun() {
    docker run -it --rm --gpus all \
        --mount type=bind,source="$(realpath $PWD)",target=/opt/app \
        "${1}" "${2:-/bin/bash}"
}

##############################################################################
# Apptainer instance management functions
##############################################################################

apl() { apptainer instance list; }

aps() { apptainer instance stop "${1}"; }

apu() {
    apptainer instance start --writable-tmpfs \
        --bind "$(realpath $PWD):${2:-/opt/app}" "${1}" "${1%.sif}"
}

##############################################################################
# EOF
##############################################################################