#!/bin/bash

KUBECTL_VERSION=1.25.0
HELM_VERSION=3.10.1

# install kubectl
curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /tmp/kubectl
sudo mv /tmp/kubectl /usr/local/bin/
sudo chmod +x /usr/local/bin/kubectl

# install helm
curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz
cd /tmp
tar xfz helm-v${HELM_VERSION}-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/
sudo chmod +x /usr/local/bin/helm
rm -rf helm* linux-amd64

# install jq
sudo apt -y install jq
