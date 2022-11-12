#!/bin/bash

INTOTO_ATTESTATION_FILE=$1

cat $INTOTO_ATTESTATION_FILE  | jq -r '.payload' | base64 --decode | jq -r '.'
