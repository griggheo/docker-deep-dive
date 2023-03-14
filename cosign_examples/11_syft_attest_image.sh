#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-eclipse-temurin-17-jre-jammy
PRIVATE_KEY_PASS=$(cat ~/.k)

TMPDIR=./tmp
rm -rf $TMPDIR
mkdir -p $TMPDIR
SYFT_ATTESTATION_FILE=$TMPDIR/syft.att.json
echo -n $PRIVATE_KEY_PASS | syft attest --key $COSIGN_PRIVATE_KEY "$IMAGE" -o cyclonedx-json > $SYFT_ATTESTATION_FILE

echo Inspecting the attestation file: 

PAYLOAD=$TMPDIR/payload.json
cat $SYFT_ATTESTATION_FILE | jq --slurp 'map(.payload | @base64d | fromjson)' > $PAYLOAD

echo "value of key '_type':"
cat $PAYLOAD | jq '.[0]._type'

echo "value of key 'predicateType':"
cat $PAYLOAD | jq '.[0].predicateType'

echo "value of key 'subject':"
cat $PAYLOAD | jq '.[0].subject'
