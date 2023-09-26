#!/bin/bash

VERSION=3.11.5

rm -rf Python-${VERSION}.*

wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.sig
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.crt

python3 -m pip install sigstore

# this signarure is known
EXPECTED_SIGNATURE_EMAIL=pablogsal@python.org

# this signarure is not known
#EXPECTED_SIGNATURE_EMAIL=nad@python.org

python3 -m sigstore verify \
  --certificate Python-${VERSION}.tgz.crt \
  --signature Python-${VERSION}.tgz.sig \
  --cert-email ${EXPECTED_SIGNATURE_EMAIL} \
  Python-${VERSION}.tgz
