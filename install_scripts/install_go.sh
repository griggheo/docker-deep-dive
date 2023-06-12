#!/bin/bash

VERSION=1.20.5

wget https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz
tar xvfz go${VERSION}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local
rm -rf go${VERSION}.linux-amd64.tar.gz
echo Make sure you set PATH=/usr/local/go/bin:$PATH
