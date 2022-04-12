# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.192.0/containers/typescript-node/.devcontainer/base.Dockerfile

ARG VARIANT="16-buster"
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${VARIANT}

ENV PATH=/root/.cargo/bin:$PATH
ENV REACT_APP_MAGICEDEN_API_HOST http://localhost:3001

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    vim \
    pkg-config \
    libudev-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.9.14/install)"
RUN cargo install --git https://github.com/project-serum/anchor --tag v0.19.0 anchor-cli --locked

RUN npm install -g mocha
RUN npm i -g @project-serum/anchor-cli
