#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/library/busybox:latest
COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub

cosign verify-attestation --policy cosign_policy.cue --key $COSIGN_PUBLIC_KEY $IMAGE
