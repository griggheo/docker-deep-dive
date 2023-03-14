#!/bin/bash

IMAGE=golang:1.16-alpine
#IMAGE=golang:1.17-alpine
#IMAGE=golang:1.18-alpine
#IMAGE=gcr.io/distroless/python3-debian11:latest
REPORT=trivy_report.sarif

trivy image --format sarif -o $REPORT $IMAGE
