#!/usr/bin/env bash
# Build the image
podman build -f Containerfile -t majordome-manylinux .

# Create container
podman create --name majordome-wheel-export majordome-manylinux

# Copy wheels out
podman cp majordome-wheel-export:/io/target/wheels/ ./dist

# Remove temporary container
podman rm majordome-wheel-export

# Move wheels to dist if nested
if [ -d dist/wheels ]; then
    mv dist/wheels/* dist/ && rmdir dist/wheels
fi

# Build documentation so Linux-only modules and plots are rendered
echo "Building documentation with Quarto..."
uv run majordome-build-qmd --extras docs