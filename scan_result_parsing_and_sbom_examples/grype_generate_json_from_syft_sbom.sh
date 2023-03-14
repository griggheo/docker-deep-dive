#!/bin/bash

SBOM=syft_sbom.json
REPORT=grype_report.json
grype -o json --file $REPORT sbom:$SBOM
