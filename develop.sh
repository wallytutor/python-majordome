#!/usr/bin/env bash
##############################################################################
# XXX: under SELinux, may need to label the current directory for container:
# sudo semanage fcontext -a -t container_file_t "$(realpath $PWD)(/.*)?"
# sudo restorecon -Rv "$(realpath $PWD)"
##############################################################################

CONTAINER=/usr/bin/podman

ensure_local_run() {
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    cd "${script_dir}" || {
        echo "Error: Cannot change to script directory: ${script_dir}" >&2
        exit 1
    }
}

clean_start() {
    ensure_local_run

    rm -rf \
        build/ \
        dist/ \
        docs/_build/ \
        src/majordome/*.so \
        src/majordome.egg-info/ \
        target/
}

majordome_build() {
    local python=$1

    "${python}" -m pip install -e .[docs,extras]

    if [ $? -ne 0 ]; then
        echo "Error: pip install failed" >&2
        exit 1
    fi

    "${python}" -m build --wheel --sdist

    if [ $? -ne 0 ]; then
        echo "Error: wheel build failed" >&2
        exit 1
    fi
}

majordome_docs_build() {
    local python=$1
    local dest="docs/references.bib"

    if [ ! -f "${dest}" ]; then
        repo="https://raw.githubusercontent.com/wallytutor/notes-book"
        file="${repo}/refs/heads/main/references.bib"
        wget "${file}" -O "${dest}"
    fi

    "${python}" -m sphinx -E -b html -c docs/ docs/src/ docs/_build/
}

majordome_develop() {
    majordome_build '/opt/python3.12/bin/python3.12'
    majordome_build '/opt/python3.13/bin/python3.13'

    # XXX: build docs with Python 3.12 for now:
    majordome_docs_build '/opt/python3.12/bin/python3.12'
}

container_start() {
    local image_name="localhost/majordome:latest"
    local image_bind="$(realpath $PWD):/opt/app"
    local context="$(realpath $PWD)/src/configuration"

    if "${CONTAINER}" image exists "${image_name}"; then
        "${CONTAINER}" run -it \
            -v "${image_bind}" "${image_name}" /bin/bash
    else
        "${CONTAINER}" build -t "majordome" \
            -f "${context}/Containerfile" "${context}"
    fi
}

main() {
    ensure_local_run
    clean_start

    if [ -f "/run/.containerenv" ] || [ -f "/.dockerenv" ]; then
        majordome_develop
    else
        container_start
    fi
}
