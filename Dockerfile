FROM ubuntu:18.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV XDG_CACHE_HOME /tmp/.cache
ENV PYTEST_ADDOPTS="-o cache_dir=/tmp"
ENV PYLINTHOME=/tmp

RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
     ca-certificates \
     curl \
     git \
     make &&\
  rm -rf /var/lib/apt/lists/*
 
RUN update-ca-certificates --fresh


RUN useradd --user-group --system --uid 999 --create-home --home /home/user user

ENV USER user
USER user
WORKDIR /home/user
RUN git clone https://github.com/Homebrew/brew.git .brew &&\
        ~/.brew/bin/brew tap homebrew/core
RUN brew install mhristof/dot/files || true
ENV PATH=/home/user/.brew/bin:$PATH
