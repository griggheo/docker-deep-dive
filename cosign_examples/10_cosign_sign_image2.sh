#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
PRIVATE_KEY_PASS=$(cat ~/.k)
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-eclipse-temurin-17-jre-jammy

echo -n $PRIVATE_KEY_PASS | cosign sign --key $COSIGN_PRIVATE_KEY "$IMAGE"
