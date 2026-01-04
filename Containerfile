# ############################################################################
#  Containerfile.general
# ############################################################################

FROM ubuntu:24.04

# ----------------------------------------------------------------------------
# Basics and avoid locale issues
# ----------------------------------------------------------------------------

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8     \
    LANGUAGE=en_US:en    \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN update-locale LANG=en_US.UTF-8

# ----------------------------------------------------------------------------
# APT installed tools
# ----------------------------------------------------------------------------

# If the image build breaks (stops installing some of the packages), then it
# may be that the database needs to be updated first; place the failing command
# just after a(nother) copy of the following line:
RUN apt-get update

# Base development toolkit:
RUN apt-get install -y build-essential git gcc g++ gfortran make cmake

# Install curl/wget and software-properties-common for adding repositories:
RUN apt-get install -y curl wget software-properties-common

# Install Python and venv tools:
RUN apt-get install -y python3 python3-venv python3-pip python3-dev

# ----------------------------------------------------------------------------
# Python environment setup
# ----------------------------------------------------------------------------

# Create a virtual environment:
RUN python3 -m venv /opt/venv

# Activate venv by using its binaries directly:
ENV PATH="/opt/venv/bin:$PATH"

# Ensure pip is up to date:
RUN python3 -m pip install --upgrade pip

# ----------------------------------------------------------------------------
# RUST
# ----------------------------------------------------------------------------

ENV CARGO_HOME=/opt/cargo
ENV RUSTUP_HOME=/opt/rustup

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path \
    --default-toolchain stable \
    --profile minimal \
    --default-host x86_64-unknown-linux-gnu

# XXX: DO I NEED THIS??
# RUN . "/opt/cargo/env

# Add Rust (Cargo actually) to PATH for all container sessions:
ENV PATH="/opt/cargo/bin:$PATH"
RUN python3 -m pip install 'maturin'

# ----------------------------------------------------------------------------
# HOME
# ----------------------------------------------------------------------------

# Set working directory:
ENV APPHOME=/opt/app
RUN mkdir -p $APPHOME
WORKDIR $APPHOME

# ----------------------------------------------------------------------------
# CLEAN UP
# ----------------------------------------------------------------------------

# Clean up and make image smaller:
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /var/tmp/build*

# ############################################################################
# EOF
# ############################################################################