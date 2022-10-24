#!/bin/bash

curl -Lo sbom-tool https://github.com/microsoft/sbom-tool/releases/latest/download/sbom-tool-linux-x64
chmod +x sbom-tool
sudo mv sbom-tool /usr/local/bin/

# running the sbom-tool#
# sbom-tool generate -b ./ms-sbom -bc path/to/sourcecode -pn flask-bootstrap -pv 0.0.1 -ps codepraxis -nsb https://codepraxis.io
