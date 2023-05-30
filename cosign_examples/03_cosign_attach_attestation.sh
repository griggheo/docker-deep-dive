#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
IMAGE=ghcr.io/codepraxis-io/spring-music:5.0.0-distroless-java17-debian11
SCAN_RESULT_FILE=reference-workspace/scan_results/spring-music-5.0.0-distroless-java17-debian11/grype-scan.json

PRIVATE_KEY_PASS=$(cat ~/.k)

echo -n $PRIVATE_KEY_PASS | cosign attest --predicate $SCAN_RESULT_FILE --key $COSIGN_PRIVATE_KEY "$IMAGE"

#crane manifest ghcr.io/codepraxis-io/spring-music:sha256-acb13064190c9264c12838dacc4cae13d73e31d6f596e101f091b760c02d71fe.att | jq
