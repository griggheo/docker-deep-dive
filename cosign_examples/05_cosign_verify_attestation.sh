#!/bin/bash

COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-distroless-java17-debian11

#cosign verify-attestation --key $COSIGN_PUBLIC_KEY "$IMAGE" | jq -r .payload | base64 --decode | jq .
TMPDIR=./tmp
mkdir -p $TMPDIR
ATTESTATION_PAYLOAD=$TMPDIR/attestation_payload.json
TRIVY_PAYLOAD=$TMPDIR/trivy_payload.json

cosign verify-attestation --key $COSIGN_PUBLIC_KEY "$IMAGE" | jq --slurp 'map(.payload | @base64d | fromjson | .predicate.Data | fromjson)' > $ATTESTATION_PAYLOAD

cat $ATTESTATION_PAYLOAD | jq -r '.[0][0]' > $TRIVY_PAYLOAD

echo Vulnerabilities:
cat $TRIVY_PAYLOAD |jq -r '.Vulnerabilities[] | .VulnerabilityID,.Severity'
