#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
IMAGE=ghcr.io/codepraxis-io/spring-music:2.0.0-distroless-java17-debian11
SCAN_RESULT_FILE=reference-workspace/scan_results/trivy_scan_results.json
PRIVATE_KEY_PASS=$(cat ~/.k)

echo -n $PRIVATE_KEY_PASS | cosign attest --predicate $SCAN_RESULT_FILE --key $COSIGN_PRIVATE_KEY "$IMAGE"

