#!/bin/bash

IMAGE=nginx

# show image tags in DockerHub
echo
echo skopeo list-tags docker://$IMAGE
skopeo list-tags docker://$IMAGE | jq -r '.Tags[]'

TAG=stable-alpine
FULL_IMAGE=docker.io/library/$IMAGE:$TAG

echo
echo skopeo inspect docker://$FULL_IMAGE
skopeo inspect docker://$FULL_IMAGE | jq -r '.' | tee skopeo-inspect-$IMAGE-$TAG.json

echo
echo podman pull $FULL_IMAGE
podman pull $FULL_IMAGE

echo
echo podman images
podman images | grep $IMAGE | grep $TAG

echo
echo podman image history $FULL_IMAGE
podman image history $FULL_IMAGE

echo
echo podman inspect $FULL_IMAGE
podman inspect $FULL_IMAGE | jq -r '.' | tee podman-inspect-$IMAGE-$TAG.json

echo
echo podman save $IMAGE:$TAG 
podman save $IMAGE:$TAG > podman-save-$IMAGE-$TAG.tar

echo 
echo tar tvf podman-save-$IMAGE-$TAG.tar
tar tvf podman-save-$IMAGE-$TAG.tar

echo mkdir -p podman-save-$IMAGE-$TAG
rm -rf podman-save-$IMAGE-$TAG
mkdir -p podman-save-$IMAGE-$TAG
mv podman-save-$IMAGE-$TAG.tar podman-save-$IMAGE-$TAG
cd podman-save-$IMAGE-$TAG
tar xvf podman-save-$IMAGE-$TAG.tar
cd ..

echo
echo display manifest from tar
cat podman-save-$IMAGE-$TAG/manifest.json | jq -r '.' | tee podman-manifest-from-tar-$IMAGE-$TAG.json

echo
echo display config from tar
CONFIG=$(cat podman-save-$IMAGE-$TAG/manifest.json | jq -r '.[0].Config')
cat podman-save-$IMAGE-$TAG/$CONFIG | jq -r '.' | tee podman-config-from-tar-$IMAGE-$TAG.json

exit 0
echo
echo crane export $IMAGE:$TAG > crane-export-$IMAGE-$TAG.tar
crane export $IMAGE:$TAG > crane-export-$IMAGE-$TAG.tar

echo
echo tar tvf crane-export-$IMAGE-$TAG.tar
tar tvf crane-export-$IMAGE-$TAG.tar > crane-export-$IMAGE-$TAG-tar-contents.txt

#echo
#echo dive $IMAGE:$TAG
#dive $IMAGE:$TAG

