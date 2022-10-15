#!/bin/bash

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
sudo mv bin/task /usr/local/bin
sudo chmod +x /usr/local/bin/task
rm -rf bin
