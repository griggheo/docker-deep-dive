#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
PRIVATE_KEY_PASS=$(cat ~/.k)
#IMAGE=ghcr.io/codepraxis-io/spring-music:4.0.0-distroless-java17-debian11
IMAGE=ghcr.io/codepraxis-io/spring-music:6.0.0-temurin-17-jre-jammy

echo -n $PRIVATE_KEY_PASS | cosign sign --key $COSIGN_PRIVATE_KEY "$IMAGE"
