#!/bin/bash

IMAGES=$(nerdctl images | grep -v REPO | awk '{printf "%s:%s\n",$1, $2 }')

for IMAGE in $IMAGES; do
	echo Running: nerdctl history $IMAGE
	#nerdctl history $IMAGE
	nerdctl history --no-trunc $IMAGE
done
