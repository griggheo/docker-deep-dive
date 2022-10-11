#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-amazoncorretto-17-alpine3-15
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-curated-alpine3.16-openjdk17
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-distroless-java11-debian11-multistage
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-distroless-java17-debian11
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-distroless-java17-debian11-multistage
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-eclipse-temurin-17-jre-jammy
IMAGE=ghcr.io/codepraxis-io/alpine3.16:openjre17
IMAGE=ghcr.io/codepraxis-io/alpine3.16:openjdk17
IMAGE=ghcr.io/codepraxis-io/ubuntu22.04:openjdk17
IMAGE=ghcr.io/codepraxis-io/ubuntu22.04:openjdk11
IMAGE=ghcr.io/codepraxis-io/ubuntu22.04:node16
IMAGE=ghcr.io/codepraxis-io/ubuntu22.04:base
IMAGE=ghcr.io/codepraxis-io/alpine3.16:openjre11
IMAGE=ghcr.io/codepraxis-io/alpine3.16:run
IMAGE=ghcr.io/codepraxis-io/alpine3.16:base
IMAGE=ghcr.io/codepraxis-io/alpine3.16:build
IMAGE=ghcr.io/codepraxis-io/alpine3.16:openjdk11

dive $IMAGE
