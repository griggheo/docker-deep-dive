#!/bin/bash

#DIGEST=ghcr.io/codepraxis-io/keyless-cosign@sha256:928d9b771f083c0722ca58ae2a551c48e346aa9df74b84f3b5829b79b74fc79b
DIGEST=ghcr.io/codepraxis-io/keyless-cosign@sha256:6b7cdd9860d9319be7e3bbf807e219baa919413947862c0abed8fbc0fe9f975f
COSIGN_EXPERIMENTAL=true cosign verify $DIGEST | jq . | tee digest.json
cat digest.json | jq -r '.[0].optional.Bundle.Payload.body' | base64 -d  | jq
