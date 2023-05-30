#!/bin/bash

VERSION=3.10.7

rm -rf Python-${VERSION}.*

wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.sig
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.crt

python3 -m pip install sigstore

#EXPECTED_SIGNATURE_EMAIL=nad@python.org
EXPECTED_SIGNATURE_EMAIL=pablogsal@python.org

python3 -m sigstore verify \
  --certificate Python-${VERSION}.tgz.crt \
  --signature Python-${VERSION}.tgz.sig \
  --cert-email ${EXPECTED_SIGNATURE_EMAIL} \
  Python-${VERSION}.tgz
