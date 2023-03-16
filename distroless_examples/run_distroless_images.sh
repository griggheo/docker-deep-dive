#!/bin/bash

# root shell!
docker run --rm -it --entrypoint sh gcr.io/distroless/python3-debian11

# See https://www.form3.tech/engineering/content/exploiting-distroless-images
docker run --rm -it --entrypoint openssl gcr.io/distroless/java17-debian11
