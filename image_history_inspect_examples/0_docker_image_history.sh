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

for IMAGE in $IMAGES; do
	echo Running: docker image history $IMAGE
	docker image history $IMAGE
	#docker image history --no-trunc $IMAGE
done
