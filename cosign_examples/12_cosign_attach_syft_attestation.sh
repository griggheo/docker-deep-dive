#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-eclipse-temurin-17-jre-jammy

TMPDIR=./tmp
SYFT_ATTESTATION_FILE=$TMPDIR/syft.att.json

cosign attach attestation "$IMAGE" --attestation $SYFT_ATTESTATION_FILE

