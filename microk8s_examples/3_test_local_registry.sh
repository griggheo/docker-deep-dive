#!/bin/bash

nerdctl pull --platform x86_64 gcr.io/google-samples/hello-app:2.0
nerdctl tag gcr.io/google-samples/hello-app:2.0 127.0.0.1:32000/hello-app:2.0
nerdctl image save 127.0.0.1:32000/hello-app:2.0 -o hello-app-2.0.tar

crane push hello-app-2.0.tar 127.0.0.1:32000/hello-app:2.0
crane ls 127.0.0.1:32000/hello-app
crane digest
crane manifest 127.0.0.1:32000/hello-app:2.0 | jq

rm -rf hello-app-2.0.tar

#sudo nerdctl push --insecure-registry 127.0.0.1:32000/hello-app:2.0
sudo microk8s kubectl apply -f hello-server-deployment.yaml
