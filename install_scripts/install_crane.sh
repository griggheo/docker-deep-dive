#!/bin/bash

CRANE_VERSION=0.14.0

mkdir -p /tmp/crane
cd /tmp/crane 
curl -sL "https://github.com/google/go-containerregistry/releases/download/v${CRANE_VERSION}/go-containerregistry_Linux_x86_64.tar.gz" > go-containerregistry.tar.gz

# verify SLSA attestation
#curl -sL https://github.com/google/go-containerregistry/releases/download/v${CRANE_VERSION}/attestation.intoto.jsonl > provenance.intoto.jsonl
#slsa-verifier -artifact-path go-containerregistry.tar.gz -provenance provenance.intoto.jsonl -source github.com/google/go-containerregistry -tag "v${CRANE_VERSION}"

tar xvfz go-containerregistry.tar.gz
sudo mv *crane /usr/local/bin 
crane version 
gcrane version
cd /tmp 
rm -rf crane

