#!/bin/bash

IMAGE=ghcr.io/codepraxis-io/dddive-springboot
TAGS=$(crane ls $IMAGE | grep 0.0.1)
for TAG in $TAGS; do
	echo Running: crane manifest $IMAGE:$TAG
	crane manifest $IMAGE:$TAG | jq -r '.'

	echo Running: crane config $IMAGE:$TAG
	crane config $IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/flask-bootstrap
TAGS=$(crane ls $IMAGE | grep 0.0.1)
for TAG in $TAGS; do
	echo Running: crane manifest $IMAGE:$TAG
	crane manifest $IMAGE:$TAG | jq -r '.'

	echo Running: crane config $IMAGE:$TAG
	crane config $IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/spring-music
TAGS=$(crane ls $IMAGE | grep 2.0.0)
for TAG in $TAGS; do
	echo Running: crane manifest $IMAGE:$TAG
	crane manifest $IMAGE:$TAG | jq -r '.'

	echo Running: crane config $IMAGE:$TAG
	crane config $IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/alpine3.16
TAGS=$(crane ls $IMAGE | grep -v sig)
for TAG in $TAGS; do
	echo Running: crane manifest $IMAGE:$TAG
	crane manifest $IMAGE:$TAG | jq -r '.'

	echo Running: crane config $IMAGE:$TAG
	crane config $IMAGE:$TAG | jq -r '.'
done

IMAGE=ghcr.io/codepraxis-io/ubuntu22.04
TAGS=$(crane ls $IMAGE | grep -v sig)
for TAG in $TAGS; do
	echo Running: crane manifest $IMAGE:$TAG
	crane manifest $IMAGE:$TAG | jq -r '.'

	echo Running: crane config $IMAGE:$TAG
	crane config $IMAGE:$TAG | jq -r '.'
done

#echo Running: crane export gcr.io/google_containers/busybox busybox.tar
#crane export gcr.io/google_containers/busybox:latest busybox.tar
