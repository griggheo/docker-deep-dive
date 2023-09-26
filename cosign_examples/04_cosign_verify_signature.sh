#!/bin/bash

COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub
<<<<<<< HEAD
#IMAGE=ghcr.io/codepraxis-io/spring-music:4.0.0-distroless-java17-debian11
IMAGE=ghcr.io/codepraxis-io/spring-music:6.0.0-temurin-17-jre-jammy
=======
IMAGE=ghcr.io/codepraxis-io/spring-music:5.0.0-distroless-java17-debian11
>>>>>>> 609d1f09afdf1cc324937a2198bc80325b096bb6

cosign verify --key $COSIGN_PUBLIC_KEY "$IMAGE"

### Triangulation

# show signature artifact
cosign triangulate $IMAGE

# show signature manifest
crane manifest $(cosign triangulate $IMAGE) | jq .
