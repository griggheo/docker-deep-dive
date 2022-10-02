FROM ghcr.io/codepraxis-io/library/ubuntu:22.04

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
    lsb-release \
    lsof \ 
    software-properties-common \
    unzip \
    vim \
    wget \
    zip


# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install docker-ce docker-ce-cli containerd.io -y

# add user with UID and GID 1000 to be used instead of root in Dockerfiles derived from this one
ENV USER_ID=1000
ENV USER_NAME=devsecops
ENV USER_HOMEDIR=/home/devsecops

RUN useradd -u ${USER_ID} -U -m -d ${USER_HOMEDIR} ${USER_NAME}

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Become non-root user
USER devsecops

