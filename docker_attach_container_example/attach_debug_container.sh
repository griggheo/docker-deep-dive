#!/bin/bash

# Credit: https://iximiuz.com/en/posts/docker-debug-slim-containers/

IMAGE=ghcr.io/codepraxis-io/spring-music:3.0.0-distroless-java17-debian11

docker run --rm -d --name spring-music $IMAGE 
sleep 7
docker logs spring-music
docker exec -it spring-music sh

docker run --rm -it \
  --name debugger \
  --pid container:spring-music \
  --network container:spring-music \
  busybox \
  sh

# now you can run
# ps auxww
# ip addr
# ls -la /proc/1/root/ (this is the original container's filesystem)

docker kill spring-music
