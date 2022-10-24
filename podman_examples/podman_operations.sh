#!/bin/bash

podman pull docker.io/library/alpine
podman  run -it  --rm docker.io/library/alpine /bin/sh
podman images

podman  run -it  --rm docker.io/library/busybox /bin/sh
podman images

podman login ghcr.io/codepraxis-io
podman tag docker.io/library/busybox:latest ghcr.io/codepraxis-io/library/busybox:latest
podman push ghcr.io/codepraxis-io/library/busybox:latest
