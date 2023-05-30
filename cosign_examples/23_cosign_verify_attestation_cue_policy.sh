#!/bin/bash

#IMAGE=ghcr.io/codepraxis-io/library/busybox:latest
IMAGE=ghcr.io/codepraxis-io/library/alpinelinux/docker-cli:latest
COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub

# this should pass
cosign verify-attestation --policy cosign_policy_before.cue --key $COSIGN_PUBLIC_KEY $IMAGE

# this should fail
cosign verify-attestation --policy cosign_policy_after.cue --key $COSIGN_PUBLIC_KEY $IMAGE
