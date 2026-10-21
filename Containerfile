# Build manylinux_2_28-compatible wheel for CPython 3.12 with Cantera support.
FROM quay.io/pypa/manylinux_2_28_x86_64

WORKDIR /io

# Minimal toolchain: Rust (for pyo3 crate) + uv (to drive maturin and tools)
RUN curl -LsSf https://sh.rustup.rs | sh -s -- -y --profile minimal
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH="/root/.cargo/bin:/root/.local/bin:${PATH}"

# Install scons with packaging and pyyaml required by Cantera SConstruct
RUN uv tool install --with packaging --with pyyaml --with jinja2 scons

# Install minimal system linear algebra and Eigen headers
RUN dnf --enablerepo=powertools install -y \
        doxygen \
        eigen3-devel \
        openblas-devel \
        lapack-devel && \
    dnf clean all && \
    ln -sf /usr/include/eigen3/Eigen /usr/include/Eigen 2>/dev/null || true && \
    ln -sf /usr/include/eigen3/unsupported /usr/include/unsupported 2>/dev/null || true

# Install Boost headers (>= 1.70 required by Cantera)
ARG BOOST_VERSION=1.84.0
RUN curl -sL https://archives.boost.io/release/${BOOST_VERSION}/source/boost_1_84_0.tar.gz | \
    tar -xz -C /usr/local/include --strip-components=1 'boost_1_84_0/boost'

# Build minimal SUNDIALS (v7.2.0)
ARG SUNDIALS_VERSION=v7.2.0
RUN git clone --depth 1 --branch ${SUNDIALS_VERSION} https://github.com/LLNL/sundials.git /tmp/sundials-src && \
    cmake -B /tmp/sundials-build -S /tmp/sundials-src \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_C_FLAGS="-O3 -fPIC" \
        -DCMAKE_CXX_FLAGS="-O3 -fPIC" \
        -DENABLE_MPI=OFF \
        -DENABLE_OPENMP=OFF \
        -DENABLE_PTHREAD=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_STATIC_LIBS=ON \
        -DEXAMPLES_ENABLE_C=OFF \
        -DEXAMPLES_ENABLE_CXX=OFF \
        -DEXAMPLES_INSTALL=OFF && \
    cmake --build /tmp/sundials-build -j"$(nproc)" && \
    cmake --install /tmp/sundials-build && \
    ldconfig && \
    rm -rf /tmp/sundials-src /tmp/sundials-build

# Build minimal Cantera (v3.2.0) C++ headers and libraries
ARG CANTERA_VERSION=v3.2.0
RUN git clone --depth 1 --branch ${CANTERA_VERSION} https://github.com/Cantera/cantera.git /tmp/cantera-src && \
    cd /tmp/cantera-src && \
    git submodule update --init --recursive data/example_data ext/HighFive ext/yaml-cpp ext/fmt && \
    scons build -j"$(nproc)" \
        prefix=/usr/local \
        libdirname=lib \
        CC=gcc \
        CXX=g++ \
        f90_interface=n \
        python_package=n \
        clib_legacy=y \
        system_sundials=y \
        sundials_include=/usr/local/include \
        sundials_libdir=/usr/local/lib \
        system_eigen=y \
        extra_inc_dirs="/usr/include/eigen3" \
        extra_lib_dirs="/usr/local/lib" \
        boost_inc_dir="/usr/local/include" \
        blas_lapack_libs="openblas,lapack" \
        optimize=y \
        optimize_flags="-O3 -fPIC" \
        cc_flags="-fPIC" \
        thread_flags="-pthread" \
        doxygen_docs=n && \
    scons install && \
    echo "/usr/local/lib" > /etc/ld.so.conf.d/cantera.conf && \
    echo "/usr/local/lib64" >> /etc/ld.so.conf.d/cantera.conf && \
    ldconfig && \
    rm -rf /tmp/cantera-src

# Environment for compiling Python C++ extensions with Cantera
RUN /opt/python/cp312-cp312/bin/pip install --no-cache-dir numpy

ENV PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:${PKG_CONFIG_PATH}" \
    LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64:${LD_LIBRARY_PATH}" \
    PYO3_PYTHON="/opt/python/cp312-cp312/bin/python"

# Copy files needed for wheel build
COPY pyproject.toml Cargo.toml Cargo.lock README.md LICENSE /io/
COPY crates /io/crates
COPY majordome /io/majordome
COPY src /io/src

# Build manylinux_2_28-compatible wheel for CPython 3.12
RUN uvx maturin build \
    --release \
    --compatibility manylinux_2_28 \
    --interpreter /opt/python/cp312-cp312/bin/python

