#!/bin/bash

IMAGE=ghcr.io/timoniersystems/gocobra
TAG=0.1.6
IMAGE_DIGEST=$(crane digest $IMAGE:$TAG)

cosign download sbom $IMAGE@${IMAGE_DIGEST}

