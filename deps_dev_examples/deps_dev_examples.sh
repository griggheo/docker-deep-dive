#!/bin/bash

# Reference: https://docs.deps.dev/api/v3alpha/

# List the advisories affecting log4j 1.2.17
curl -s https://api.deps.dev/v3alpha/systems/maven/packages/log4j%3Alog4j/versions/1.2.17  | jq '.advisoryKeys[].id'

# pull docker image for grpcurl
docker pull fullstorydev/grpcurl:latest

# query deps.dev with grpcurl
docker run fullstorydev/grpcurl:latest \
  -d '{"package_key":{"system":"NPM","name":"@colors/colors"}}' \
  api.deps.dev:443 \
  deps_dev.v3alpha.Insights/GetPackage
        
# get information about a package version, including its licenses and any security advisories known to affect it.
curl -s https://api.deps.dev/v3alpha/systems/npm/packages/%40colors%2Fcolors/versions/1.5.0 | jq

# list package dependencies
curl -s https://api.deps.dev/v3alpha/systems/npm/packages/react/versions/18.2.0:dependencies | jq

# get project information
curl -s https://api.deps.dev/v3alpha/projects/github.com%2Ffacebook%2Freact | jq

# get information about security advisories hosted by OSV.
curl -s https://api.deps.dev/v3alpha/advisories/GHSA-2qrg-x229-3v8q | jq
