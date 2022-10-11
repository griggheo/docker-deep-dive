#!/bin/bash

IMAGES="
ghcr.io/codepraxis-io/spring-music:2.0.0-buildx-eclipse-temurin-17-jre-jammy
ghcr.io/codepraxis-io/spring-music:2.0.0-jib-eclipse-temurin-17-jre-jammy
ghcr.io/codepraxis-io/spring-music:2.0.0-podman-eclipse-temurin-17-jre-jammy
ghcr.io/codepraxis-io/spring-music:2.0.0-kaniko-amazoncorretto-17-alpine3-15
ghcr.io/codepraxis-io/spring-music:2.0.0-kaniko-curated-alpine3.16-openjdk17
ghcr.io/codepraxis-io/spring-music:2.0.0-buildx-distroless-java11-debian11-multistage
ghcr.io/codepraxis-io/spring-music:2.0.0-buildx-distroless-java17-debian11
ghcr.io/codepraxis-io/spring-music:2.0.0-cnb-java11"


echo "
ghcr.io/codepraxis-io/alpine3.16:base
ghcr.io/codepraxis-io/alpine3.16:build
ghcr.io/codepraxis-io/alpine3.16:run
ghcr.io/codepraxis-io/alpine3.16:openjre11
ghcr.io/codepraxis-io/alpine3.16:openjdk11
ghcr.io/codepraxis-io/alpine3.16:openjre17
ghcr.io/codepraxis-io/alpine3.16:openjdk17
ghcr.io/codepraxis-io/ubuntu22.04:base
ghcr.io/codepraxis-io/ubuntu22.04:openjdk11
ghcr.io/codepraxis-io/ubuntu22.04:openjdk17
ghcr.io/codepraxis-io/ubuntu22.04:node16"

for IMAGE in $IMAGES; do
#	echo Running: oras manifest fetch $IMAGE
#	oras manifest fetch $IMAGE | jq -r '.'

	echo Running: oras manifest fetch-config $IMAGE
	oras manifest fetch-config $IMAGE | jq -r '.'
done
