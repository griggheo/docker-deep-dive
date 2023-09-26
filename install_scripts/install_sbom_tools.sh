#!/bin/bash

# sbom-manager
pip3 install sbom-manager

# sbom-utility
VERSION=0.11.0
curl -LO https://github.com/CycloneDX/sbom-utility/releases/download/v$VERSION/sbom-utility-v$VERSION-linux-amd64.tar.gz
mkdir -p ~/code/sbom-utility
tar -zxf  sbom-utility-v$VERSION-linux-amd64.tar.gz -C ~/code/sbom-utility
rm -rf sbom-utility-v$VERSION-linux-amd64.tar.gz
