#!/bin/bash

#IMAGE=ghcr.io/codepraxis-io/library/busybox:latest
IMAGE=ghcr.io/codepraxis-io/library/alpinelinux/docker-cli:latest
COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
PREDICATE_FILE=/tmp/predicate
PRIVATE_KEY_PASS=$(cat ~/.k)

crane digest $IMAGE

echo "test202305" > $PREDICATE_FILE

echo -n $PRIVATE_KEY_PASS | cosign attest --predicate $PREDICATE_FILE --key $COSIGN_PRIVATE_KEY "$IMAGE"
