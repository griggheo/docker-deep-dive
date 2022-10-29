#!/bin/bash

COSIGN_PRIVATE_KEY=$HOME/.cosign/cosign.key
COSIGN_PUBLIC_KEY=$HOME/.cosign/cosign.pub
PRIVATE_KEY_PASS=$(cat ~/.k)
IMAGE=ghcr.io/codepraxis-io/nginx
TAG=stable-alpine

echo cosign sign $IMAGE:$TAG
echo -n $PRIVATE_KEY_PASS | cosign sign --key $COSIGN_PRIVATE_KEY $IMAGE:$TAG

echo
echo crane ls $IMAGE
crane ls $IMAGE

echo
echo crane digest $IMAGE:$TAG
crane digest $IMAGE:$TAG

SHA=$(crane ls $IMAGE|grep sha256) 
echo
echo Running: crane config $IMAGE:$SHA
crane config $IMAGE:$SHA | jq -r '.' | tee crane-config-$IMAGE-$SHA.json

echo
echo Running: crane manifest $IMAGE:$SHA
crane manifest $IMAGE:$SHA | jq -r '.' | tee crane-manifest-$IMAGE-$SHA.json

echo
echo crane export $IMAGE:$SHA 
crane export $IMAGE:$SHA > crane-export-nginx-$SHA.json

echo
echo display crane-export-nginx-$SHA.json
cat crane-export-nginx-$SHA.json | jq -r '.'

echo
echo cosign verify --key $COSIGN_PUBLIC_KEY $IMAGE:$TAG
cosign verify --key $COSIGN_PUBLIC_KEY $IMAGE:$TAG

#echo
#echo dive $IMAGE:$TAG
#dive $IMAGE:$TAG

