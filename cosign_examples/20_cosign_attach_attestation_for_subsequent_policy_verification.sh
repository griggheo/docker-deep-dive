#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/library/busybox:latest
COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
PREDICATE_FILE=/tmp/predicate
PRIVATE_KEY_PASS=$(cat ~/.k)

crane digest $IMAGE

echo "test1" > $PREDICATE_FILE

echo -n $PRIVATE_KEY_PASS | cosign attest --predicate $PREDICATE_FILE --key $COSIGN_PRIVATE_KEY "$IMAGE"
