#!/bin/bash

mkdir -p myalpine/rootfs

echo Download and unarchive Alpine mini rootfs
MINIROOT=alpine-minirootfs-3.17.2-x86_64.tar.gz
wget https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/$MINIROOT
tar -xzf $MINIROOT -C myalpine/rootfs
rm $MINIROOT

