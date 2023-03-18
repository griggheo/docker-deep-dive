#!/bin/bash

SOURCE_URI=github.com/codepraxis-io/katana
#SOURCE_TAG=v1.0.1
SOURCE_TAG=v1.0.3
ARTIFACT_FILE=katana-linux-amd64
INTOTO_ATTESTATION=katana-linux-amd64.intoto.jsonl

rm -rf $ARTIFACT_FILE $INTOTO_ATTESTATION
wget https://${SOURCE_URI}/releases/download/${SOURCE_TAG}/${ARTIFACT_FILE}
wget https://${SOURCE_URI}/releases/download/${SOURCE_TAG}/${INTOTO_ATTESTATION}

~/go/bin/slsa-verifier verify-artifact $ARTIFACT_FILE \
  --provenance-path $INTOTO_ATTESTATION \
  --source-uri $SOURCE_URI \
  --source-tag $SOURCE_TAG \
  --print-provenance
