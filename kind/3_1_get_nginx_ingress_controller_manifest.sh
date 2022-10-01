#!/bin/bash

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
mv deploy.yaml ingress-nginx-deploy.yaml
