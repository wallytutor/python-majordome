# Build manylinux_2_28-compatible wheel for CPython 3.12.
FROM quay.io/pypa/manylinux_2_28_x86_64

WORKDIR /io

# Minimal toolchain: Rust (for pyo3 crate) + uv (to drive maturin)
RUN curl -LsSf https://sh.rustup.rs | sh -s -- -y --profile minimal
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH="/root/.cargo/bin:/root/.local/bin:${PATH}"

# Copy only files needed for wheel build.
COPY pyproject.toml Cargo.toml Cargo.lock build.rs README.md LICENSE /io/
COPY src /io/src
COPY majordome /io/majordome

# Build manylinux_2_28-compatible wheel for CPython 3.12
RUN uvx maturin build \
	--release \
	--compatibility manylinux_2_28 \
	--interpreter /opt/python/cp312-cp312/bin/python
