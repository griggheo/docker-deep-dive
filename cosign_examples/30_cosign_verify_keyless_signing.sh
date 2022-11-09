#!/bin/bash

DIGEST=ghcr.io/codepraxis-io/keyless-cosign@sha256:928d9b771f083c0722ca58ae2a551c48e346aa9df74b84f3b5829b79b74fc79b
COSIGN_EXPERIMENTAL=true cosign verify $DIGEST | jq .

