#!/bin/bash

for f in $(find . -name Dockerfile\*); do echo RUNNING TRIVY CONFIG FOR $f; trivy config $f; done
