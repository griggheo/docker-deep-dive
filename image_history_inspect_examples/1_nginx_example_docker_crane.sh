#!/bin/bash

IMAGE=nginx

# show image tags in DockerHub
echo
echo crane ls $IMAGE
crane ls $IMAGE

TAG=stable-alpine

echo
echo docker pull $IMAGE:$TAG
docker pull $IMAGE:$TAG

echo
echo docker images
docker images | grep $IMAGE | grep $TAG

echo
echo docker image history $IMAGE:$TAG
docker image history $IMAGE:$TAG

echo
echo docker inspect $IMAGE:$TAG
docker inspect $IMAGE:$TAG | jq -r '.' | tee docker-inspect-$IMAGE-$TAG.json

echo Getting size for $IMAGE:$TAG
size=$(docker inspect $IMAGE:$TAG | jq '.[].Size')
echo size=$size
size_in_mb=$((size / (1024*1024)))
echo size_in_mb=$size_in_mb MB

echo
echo Running: crane config $IMAGE:$TAG
crane config $IMAGE:$TAG | jq -r '.' | tee crane-config-$IMAGE-$TAG.json

echo
echo Running: crane manifest $IMAGE:$TAG
crane manifest $IMAGE:$TAG | jq -r '.' | tee crane-manifest-$IMAGE-$TAG.json

echo
echo docker save $IMAGE:$TAG 
docker save $IMAGE:$TAG > docker-save-$IMAGE-$TAG.tar

echo 
echo tar tvf docker-save-$IMAGE-$TAG.tar
tar tvf docker-save-$IMAGE-$TAG.tar

echo mkdir -p docker-save-$IMAGE-$TAG
rm -rf docker-save-$IMAGE-$TAG
mkdir -p docker-save-$IMAGE-$TAG
mv docker-save-$IMAGE-$TAG.tar docker-save-$IMAGE-$TAG
cd docker-save-$IMAGE-$TAG
tar xvf docker-save-$IMAGE-$TAG.tar
cd ..

echo
echo display manifest from tar
cat docker-save-$IMAGE-$TAG/manifest.json | jq -r '.' | tee docker-manifest-from-tar-$IMAGE-$TAG.json

echo
echo display config from tar
CONFIG=$(cat docker-save-$IMAGE-$TAG/manifest.json | jq -r '.[0].Config')
cat docker-save-$IMAGE-$TAG/$CONFIG | jq -r '.' | tee docker-config-from-tar-$IMAGE-$TAG.json

echo
echo crane export $IMAGE:$TAG > crane-export-$IMAGE-$TAG.tar
crane export $IMAGE:$TAG > crane-export-$IMAGE-$TAG.tar

echo
echo tar tvf crane-export-$IMAGE-$TAG.tar
tar tvf crane-export-$IMAGE-$TAG.tar > crane-export-$IMAGE-$TAG-tar-contents.txt

echo
echo crane copy $IMAGE:$TAG ghcr.io/codepraxis-io/$IMAGE:$TAG
crane copy $IMAGE:$TAG ghcr.io/codepraxis-io/$IMAGE:$TAG

echo
echo crane digest $IMAGE:$TAG
crane digest $IMAGE:$TAG

echo
echo crane digest ghcr.io/codepraxis-io/$IMAGE:$TAG
crane digest ghcr.io/codepraxis-io/$IMAGE:$TAG
#echo
#echo dive $IMAGE:$TAG
#dive $IMAGE:$TAG

