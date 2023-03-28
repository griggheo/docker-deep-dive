#!/bin/bash

COSIGN_VERSION=2.0.0

wget "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-linux-amd64" 
sudo mv cosign-linux-amd64 /usr/local/bin/cosign 
chmod +x /usr/local/bin/cosign
