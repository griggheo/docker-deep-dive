#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/library/busybox:latest
COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub

cosign verify-attestation --key $COSIGN_PUBLIC_KEY $IMAGE | jq -r .payload | base64 --decode | jq .

