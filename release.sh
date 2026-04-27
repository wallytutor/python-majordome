#!/usr/bin/env bash
# Build the image
podman build -f Containerfile -t majordome-manylinux .

# Create container
podman create --name majordome-wheel-export majordome-manylinux

# Copy wheels out
podman cp majordome-wheel-export:/io/target/wheels/ ./dist

# Remove temporary container
podman rm majordome-wheel-export

# Move wheels to dist
mv dist/wheels/* dist/ && rmdir dist/wheels