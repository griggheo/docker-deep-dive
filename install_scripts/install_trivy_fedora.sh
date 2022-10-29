#!/bin/bash

TRIVY_VERSION=0.32.1
sudo rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.rpm

