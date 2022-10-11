#!/bin/bash

PRIVATE_KEY_PASS=$(cat ~/.k)

echo -n $PRIVATE_KEY_PASS | cosign generate-key-pair
mkdir -p ~/.cosign
mv cosign.* ~/.cosign
