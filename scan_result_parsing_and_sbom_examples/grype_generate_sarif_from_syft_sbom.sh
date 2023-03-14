#!/bin/bash
SBOM=syft_sbom.json
REPORT=grype_report.sarif
grype -o sarif --file $REPORT sbom:$SBOM

