#!/usr/bin/env bash

ensure_repository() {
    local repo_url=$1
    local target_dir=$2

    if [ -d "$target_dir/.git" ]; then
        echo "Repository $target_dir exists, pulling latest changes..."
        git -C "$target_dir" pull
    else
        echo "Cloning repository $repo_url into $target_dir..."
        git clone "$repo_url" "$target_dir"
    fi
}

main() {
    echo "Setting up SU2 Tutorials and Test Cases..."

    template="config_template.cfg"

    if [[ ! -f "$template" ]]; then
        echo "Downloading SU2 configuration template..."
        cfg="https://raw.githubusercontent.com/su2code/SU2/refs/heads/master/config_template.cfg"
        wget -O "$template" "$cfg"
    else
        echo "Configuration template already exists."
    fi

    tuto="tuto"
    test="test"

    tuto_repo="https://github.com/su2code/Tutorials.git"
    test_repo="https://github.com/su2code/TestCases.git"

    ensure_repository "$tuto_repo" "$tuto"
    ensure_repository "$test_repo" "$test"
}

main "$@"
