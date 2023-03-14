#!/bin/bash

curl -Lo sbom-scorecard https://github.com/eBay/sbom-scorecard/releases/download/0.0.6/sbom-scorecard-linux-amd64
chmod +x sbom-scorecard
sudo mv sbom-scorecard /usr/local/bin/

