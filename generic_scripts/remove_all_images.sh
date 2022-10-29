#!/bin/bash

docker images | awk '{print $3}' | xargs docker rmi  --force
