#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
#IMAGE=ghcr.io/codepraxis-io/spring-music:4.0.0-distroless-java17-debian11
#SCAN_RESULT_FILE=reference-workspace/scan_results/spring-music-4.0.0-distroless-java17-debian11/grype-scan.json
IMAGE=ghcr.io/codepraxis-io/spring-music:6.0.0-temurin-17-jre-jammy
SCAN_RESULT_FILE=reference-workspace/scan_results/spring-music-6.0.0-temurin-17-jre-jammy/trivy-scan.json

PRIVATE_KEY_PASS=$(cat ~/.k)

echo -n $PRIVATE_KEY_PASS | cosign attest --predicate $SCAN_RESULT_FILE --key $COSIGN_PRIVATE_KEY "$IMAGE"

<<<<<<< HEAD
crane manifest ghcr.io/codepraxis-io/spring-music:sha256-4cbf5098d309334d17ef9fb23236376dfac25c0e85bf19540cd8fd82b1e0460f.att | jq
=======
#crane manifest ghcr.io/codepraxis-io/spring-music:sha256-acb13064190c9264c12838dacc4cae13d73e31d6f596e101f091b760c02d71fe.att | jq
>>>>>>> 609d1f09afdf1cc324937a2198bc80325b096bb6
