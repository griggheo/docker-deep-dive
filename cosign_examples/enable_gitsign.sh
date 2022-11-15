#!/bin/bash

# install gitsign
brew tap sigstore/tap
brew install gitsign

git config --global commit.gpgsign true  # Sign all commits
git config --global tag.gpgsign true  # Sign all tags
git config --global gpg.x509.program gitsign  # Use Gitsign for signing
git config --global gpg.format x509  # Gitsign expects x509 args
