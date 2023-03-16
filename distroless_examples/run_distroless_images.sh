#!/bin/bash

docker run --rm -it --entrypoint sh gcr.io/distroless/python3-debian11
docker run --rm -it --entrypoint openssl gcr.io/distroless/java17-debian11
