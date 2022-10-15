#!/bin/bash

curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b $HOME/.local/bin
chmod +x $HOME/.local/bin/grype

curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b $HOME/.local/bin
chmod +x $HOME/.local/bin/syft
