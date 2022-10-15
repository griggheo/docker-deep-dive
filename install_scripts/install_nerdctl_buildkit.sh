#!/bin/bash

NERDCTL_VERSION=0.22.2
BUILDKIT_VERSION=0.10.4

sudo apt-get install uidmap -y
sudo apt-get install rootlesskit -y
wget https://github.com/containerd/nerdctl/releases/download/v${NERDCTL_VERSION}/nerdctl-${NERDCTL_VERSION}-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local/bin nerdctl-${NERDCTL_VERSION}-linux-amd64.tar.gz
rm nerdctl-${NERDCTL_VERSION}-linux-amd64.tar.gz

# set up rootless mode
echo "kernel.unprivileged_userns_clone=1" | sudo tee -a /etc/sysctl.d/99-rootless.conf
containerd-rootless-setuptool.sh install

sudo sh -c "echo 1 > /proc/sys/kernel/unprivileged_userns_clone"
sudo sysctl --system

# install buildkitd
wget https://github.com/moby/buildkit/releases/download/v${BUILDKIT_VERSION}/buildkit-v${BUILDKIT_VERSION}.linux-amd64.tar.gz
sudo tar Cxzvf /usr/local buildkit-v${BUILDKIT_VERSION}.linux-amd64.tar.gz
rm buildkit-v${BUILDKIT_VERSION}.linux-amd64.tar.gz

# configure buildkitd with containerd in rootless mode
CONTAINERD_NAMESPACE=default containerd-rootless-setuptool.sh install-buildkit-containerd

systemctl --user status default-buildkit.service
