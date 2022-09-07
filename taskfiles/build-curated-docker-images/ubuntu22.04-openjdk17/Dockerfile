FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install default-jdk
RUN apt update -y \
    && apt install openjdk-17-jdk -y \
    && apt install maven -y

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*
