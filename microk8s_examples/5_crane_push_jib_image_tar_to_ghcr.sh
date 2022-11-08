#!/bin/bash

#JIB_IMAGE_TAR=../taskfiles/build-java-maven-sample-springboot/workspace-eNPXc6F2vu/sourcecode/dddive-springboot/target/jib-image.tar
#JIB_IMAGE_TAR=../taskfiles/build-java-maven-sample-springboot/workspace-peuE93yqHm/sourcecode/dddive-springboot/target/jib-image.tar
JIB_IMAGE_TAR=../taskfiles/build-jib-springboot-helloworld/workspace-v7ukjXgyqH/sourcecode/springboot-helloworld/target/jib-image.tar
REGISTRY=ghcr.io/codepraxis-io
IMAGE=springboot-helloworld
IMAGE_TAG=0.0.1-jib-nerdctl

echo Running: crane push $JIB_IMAGE_TAR ${REGISTRY}/$IMAGE:$IMAGE_TAG
crane push $JIB_IMAGE_TAR ${REGISTRY}/$IMAGE:$IMAGE_TAG
echo

echo Runing: crane manifest ${REGISTRY}/$IMAGE:$IMAGE_TAG 
crane manifest ${REGISTRY}/$IMAGE:$IMAGE_TAG | jq -r '.'
echo

echo Running: crane config ${REGISTRY}/$IMAGE:$IMAGE_TAG 
crane config ${REGISTRY}/$IMAGE:$IMAGE_TAG | jq -r '.'
echo

# to run the image as a container:
# nerdctl run --cni-path=/opt/cni/bin --rm ${REGISTRY}/$IMAGE:$IMAGE_TAG
# or
# nerdctl run -d --cni-path=/opt/cni/bin  -p 8080:8080  ghcr.io/codepraxis-io/springboot-helloworld:0.0.1-jib-nerdctl
# nerdctl ps
# curl localhost:8080
