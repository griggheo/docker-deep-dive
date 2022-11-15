#!/bin/bash

VERSION=3.10.7

wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.sig
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz.crt

python3 -m pip install sigstore

python3 -m sigstore verify \
  --certificate Python-${VERSION}.tgz.crt \
  --signature Python-${VERSION}.tgz.sig \
  --cert-email pablogsal@python.org \
  Python-${VERSION}.tgz
