FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH="/root/.cargo/bin:/root/.npm-global/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cargo \
    clang \
    cmake \
    curl \
    gcc \
    git \
    libffi-dev \
    libpq-dev \
    libsqlite3-dev \
    libssl-dev \
    libssl-dev \
    libudev-dev \
    llvm \
    make \
    nodejs \
    npm \
    pkg-config \
    protobuf-compiler \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    rustc \
    vim \
    wget \
    zsh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN chsh -s $(which zsh) root

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN rustup default stable
RUN rustup update
RUN rustup target add wasm32-unknown-unknown
RUN rustup update nightly
RUN rustup target add wasm32-unknown-unknown --toolchain nightly
RUN rustup component add rust-src
RUN rustup component add clippy
RUN cargo install cargo-audit

RUN mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
RUN npm install -g yarn pnpm typescript ts-node eslint prettier

RUN pip install --no-cache-dir poetry black pylint flake8 mypy

WORKDIR /workspace

CMD ["/bin/bash"]
