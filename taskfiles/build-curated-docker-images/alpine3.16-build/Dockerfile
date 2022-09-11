FROM alpine:3.16

# Install basic tools
RUN set -eux \
    #&& apk --no-cache add alpine-sdk \
    && apk --no-cache add \
    bash \
    ca-certificates \
    curl \
    gettext \
    git \
    gnupg \
    gpg-agent \
    jq \
    lsof \ 
    unzip \
    vim \
    wget \
    zip

# add user with UID and GID 1000 to be used instead of root
ENV USER_ID=1000
ENV GROUP_ID=1000
ENV USER_NAME=devsecops
ENV GROUP_NAME=devsecops
ENV USER_HOMEDIR=/home/devsecops

RUN addgroup -g ${GROUP_ID} ${GROUP_NAME} \
    && adduser -u ${USER_ID} -G ${GROUP_NAME} -D -h ${USER_HOMEDIR} ${USER_NAME}

# Cleanup
RUN rm -rf /var/cache/apk/*

# Switch to non-root user
USER devsecops

