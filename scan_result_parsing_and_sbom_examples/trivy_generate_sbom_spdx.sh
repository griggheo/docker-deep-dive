#!/bin/bash

IMAGE=$1
if [ "$IMAGE" == "" ]; then
  IMAGE=golang:1.16-alpine
fi
# crane ls golang | grep alpine | grep 19
#IMAGE=golang:1.17-alpine
#IMAGE=golang:1.18-alpine
#IMAGE=golang:1.19-alpine
#IMAGE=gcr.io/distroless/python3-debian11:latest
#crane ls ghcr.io/codepraxis-io/flask-bootstrap | grep 0.0.1|grep podman
#
REPORT=trivy_sbom_spdx.json

trivy image --format spdx-json --output $REPORT $IMAGE

