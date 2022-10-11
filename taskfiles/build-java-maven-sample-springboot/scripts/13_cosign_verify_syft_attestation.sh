#!/bin/bash

COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-eclipse-temurin-17-jre-jammy

#cosign verify-attestation --key $COSIGN_PUBLIC_KEY "$IMAGE" | jq -r .payload | base64 --decode | jq .
TMPDIR=./tmp
rm -rf $TMPDIR
mkdir -p $TMPDIR
SYFT_ATTESTATION_FILE=$TMPDIR/syft_attestation.json
SYFT_ATTESTATION_PAYLOAD=$TMPDIR/syft_attestation_payload.json

PREDICATE_TYPE="https://cyclonedx.org/bom"
cosign verify-attestation --key $COSIGN_PUBLIC_KEY --type ${PREDICATE_TYPE} "$IMAGE" > $SYFT_ATTESTATION_FILE

cat $SYFT_ATTESTATION_FILE | jq --slurp 'map(.payload | @base64d | fromjson)' > $SYFT_ATTESTATION_PAYLOAD

echo SBOM Components:
cat $SYFT_ATTESTATION_PAYLOAD | jq -r '.[0].predicate.components[]."bom-ref"'
