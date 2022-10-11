#!/bin/bash

# install slsa-verifier
wget https://github.com/slsa-framework/slsa-verifier/releases/download/v1.3.1/slsa-verifier-linux-amd64
wget https://github.com/slsa-framework/slsa-verifier/releases/download/v1.3.1/slsa-verifier-linux-amd64.intoto.jsonl
mv slsa-verifier-linux-amd64 slsa-verifier
chmod +x slsa-verifier
# verify attestation
./slsa-verifier -artifact-path slsa-verifier \
  -provenance slsa-verifier-linux-amd64.intoto.jsonl \
  -source github.com/slsa-framework/slsa-verifier \
  -tag v1.3.1

sudo mv slsa-verifier /usr/local/bin

sudo apt install -y default-jre
wget https://github.com/GoogleContainerTools/jib/releases/download/v0.11.0-cli/jib-jre-0.11.0.zip
wget https://github.com/GoogleContainerTools/jib/releases/download/v0.11.0-cli/attestation.intoto.jsonl

# verify attestation
slsa-verifier -artifact-path jib-jre-0.11.0.zip -provenance attestation.intoto.jsonl -source github.com/GoogleContainerTools/jib -branch master -workflow-input release_version=0.11.0

unzip jib-jre-0.11.0.zip
mv jib-0.11.0 $HOME

rm -rf slsa-verifier*
rm -rf jib*zip
rm -rf attestation.intoto*

echo 'export PATH=$PATH:$HOME/jib-0.11.0/bin' >> $HOME/.bashrc
