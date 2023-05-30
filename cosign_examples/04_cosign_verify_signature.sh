#!/bin/bash

COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub
IMAGE=ghcr.io/codepraxis-io/spring-music:5.0.0-distroless-java17-debian11

cosign verify --key $COSIGN_PUBLIC_KEY "$IMAGE"

### Triangulation

# show signature artifact
cosign triangulate $IMAGE

# show signature manifest
crane manifest $(cosign triangulate $IMAGE) | jq .
