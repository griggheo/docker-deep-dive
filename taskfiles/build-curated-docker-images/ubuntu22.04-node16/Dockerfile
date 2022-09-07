FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update apt
RUN apt update -y

# Install node 16
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*
