#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/dddive-springboot
TAGS=$(skopeo list-tags docker://$IMAGE | jq -r '.Tags[]' | grep 0.0.1)
for TAG in $TAGS; do
	echo Running: skopeo inspect docker://$IMAGE:$TAG
	skopeo inspect docker://$IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/flask-bootstrap
TAGS=$(skopeo list-tags docker://$IMAGE | jq -r '.Tags[]' | grep 0.0.1)
for TAG in $TAGS; do
	echo Running: skopeo inspect docker://$IMAGE:$TAG
	skopeo inspect docker://$IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/spring-music
TAGS=$(skopeo list-tags docker://$IMAGE | jq -r '.Tags[]' | grep 2.0.0)
for TAG in $TAGS; do
	echo Running: skopeo inspect docker://$IMAGE:$TAG
	skopeo inspect docker://$IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/alpine3.16
TAGS=$(skopeo list-tags docker://$IMAGE | jq -r '.Tags[]' | grep -v sig)
for TAG in $TAGS; do
	echo Running: skopeo inspect docker://$IMAGE:$TAG
	skopeo inspect docker://$IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/ubuntu22.04
TAGS=$(skopeo list-tags docker://$IMAGE | jq -r '.Tags[]' | grep -v sig)
for TAG in $TAGS; do
	echo Running: skopeo inspect docker://$IMAGE:$TAG
	skopeo inspect docker://$IMAGE:$TAG | jq -r '.'
done
