#!/bin/bash

nerdctl pull gcr.io/google-samples/hello-app:1.0
nerdctl tag gcr.io/google-samples/hello-app:1.0 127.0.0.1:32000/hello-app:1.0
nerdctl push --insecure-registry 127.0.0.1:32000/hello-app:1.0
microk8s kubectl create deployment hello-server --image=127.0.0.1:32000/hello-app:1.0
