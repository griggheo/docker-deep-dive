FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN set -eux \
    && apt-get update -y \
    && mkdir -p /usr/share/man/man1 \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    bash \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    gettext-base \
    git-all \
    gnupg-agent \
    gnupg2 \
    jq \
    lsof \ 
    software-properties-common \
    unzip \
    vim \
    wget \
    zip

# add user with UID and GID 1000 to be used instead of root in Dockerfiles derived from this one
ENV USER_ID=1000
ENV USER_NAME=devsecops
ENV USER_HOMEDIR=/home/devsecops

RUN useradd -u ${USER_ID} -U -m -d ${USER_HOMEDIR} ${USER_NAME}

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Become non-root user
USER devsecops

