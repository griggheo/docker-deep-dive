#!/bin/bash

DIVE_VERSION=0.10.0

wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb
sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb
#rm ./dive_${DIVE_VERSION}_linux_amd64.deb
