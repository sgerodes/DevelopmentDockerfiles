FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH="/root/.cargo/bin:/root/.npm-global/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    wget \
    git \
    zsh \
    vim \
    python3 \
    python3-pip \
    python3-venv \
    rustc \
    cargo \
    llvm \
    cmake \
    libssl-dev \
    pkg-config \
    libffi-dev \
    libpq-dev \
    libsqlite3-dev \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN mkdir ~/.npm-global && npm config set prefix '~/.npm-global'
RUN npm install -g yarn pnpm typescript ts-node eslint prettier
RUN pip install --no-cache-dir poetry black pylint flake8 mypy
WORKDIR /workspace

CMD ["/bin/bash"]
