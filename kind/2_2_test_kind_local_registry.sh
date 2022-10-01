#!/bin/bash

docker pull gcr.io/google-samples/hello-app:1.0
docker tag gcr.io/google-samples/hello-app:1.0 localhost:5001/hello-app:1.0
docker push localhost:5001/hello-app:1.0
kubectl create deployment hello-server --image=localhost:5001/hello-app:1.0
