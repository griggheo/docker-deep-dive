#!/bin/bash

echo Running: crane catalog localhost:5001
crane catalog localhost:5001

echo Running: crane ls localhost:5001/hello-app
crane ls localhost:5001/hello-app

tag=1.0
echo Running: crane digest localhost:5001/hello-app:$tag
crane digest localhost:5001/hello-app:$tag

echo Running: crane manifest localhost:5001/hello-app:$tag
crane manifest localhost:5001/hello-app:$tag

echo Running: crane blob localhost:5001/hello-app@sha256:f4d42e081a02b89d8bab78682f5879e6b593efe76690872c71a7a04910ee474a
crane blob localhost:5001/hello-app@sha256:f4d42e081a02b89d8bab78682f5879e6b593efe76690872c71a7a04910ee474a > blob_config.json
cat blob_config.json | jq -r '.'

echo Running: crane blob localhost:5001/hello-app@sha256:59bf1c3509f33515622619af21ed55bbe26d24913cedbca106468a5fb37a50c3
crane blob localhost:5001/hello-app@sha256:59bf1c3509f33515622619af21ed55bbe26d24913cedbca106468a5fb37a50c3 > blob_layer1.tar.gz

echo Running: crane validate --remote localhost:5001/hello-app:$tag
crane validate --remote localhost:5001/hello-app:$tag

newtag=1.1
echo Running: crane tag localhost:5001/hello-app:$tag $newtag
crane tag localhost:5001/hello-app:$tag $newtag

echo Running: crane ls localhost:5001/hello-app
crane ls localhost:5001/hello-app

echo Running: crane digest localhost:5001/hello-app:$newtag
crane digest localhost:5001/hello-app:$newtag

echo Running: crane export localhost:5001/hello-app:$newtag hello-app.tar
crane export localhost:5001/hello-app:$newtag hello-app.tar

echo Running: crane ls ghcr.io/codepraxis-io/spring-music
crane ls ghcr.io/codepraxis-io/spring-music

echo Running: crane copy localhost:5001/hello-app:1.0 ghcr.io/codepraxis-io/hello-app:1.0
crane copy localhost:5001/hello-app:1.0 ghcr.io/codepraxis-io/hello-app:1.0

echo Running: crane ls gcr.io/google_containers/busybox
crane ls gcr.io/google_containers/busybox

echo Running: crane manifest gcr.io/google_containers/busybox:latest
crane manifest gcr.io/google_containers/busybox:latest | jq -r '.'

echo Running: crane export gcr.io/google_containers/busybox busybox.tar
crane export gcr.io/google_containers/busybox:latest busybox.tar
