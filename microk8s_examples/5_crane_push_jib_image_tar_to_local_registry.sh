#!/bin/bash

JIB_IMAGE_TAR=../taskfiles/build-jib-springboot-helloworld/workspace-QatQ6HRcFZ/sourcecode/springboot-helloworld/target/jib-image.tar
LOCAL_REGISTRY=127.0.0.1:32000
IMAGE=springboot-helloworld
IMAGE_TAG=0.0.2-jib-nerdctl

echo Running: crane push $JIB_IMAGE_TAR ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG
crane push $JIB_IMAGE_TAR ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG
echo

echo Runing: crane manifest ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG 
crane manifest ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG | jq -r '.'
echo

echo Running: crane config ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG 
crane config ${LOCAL_REGISTRY}/$IMAGE:$IMAGE_TAG | jq -r '.'
echo
