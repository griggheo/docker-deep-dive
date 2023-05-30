#!/bin/bash

SBOM=trivy_sbom_spdx.json
REPORT=trivy_sbom_scan_report.json

trivy sbom $SBOM -f json -o $REPORT

echo Vulnerabilities
cat $REPORT | jq '.Results[0].Vulnerabilities[]'
echo

echo CVE list
cat $REPORT | jq '.Results[0].Vulnerabilities[].VulnerabilityID'
echo

echo CVE + URL
cat $REPORT | jq '.Results[0].Vulnerabilities[]' | jq  -r '[.VulnerabilityID,.PrimaryURL]|@tsv'
echo

echo CVE + URL + Title
cat $REPORT | jq '.Results[0].Vulnerabilities[]' | jq -r '[.VulnerabilityID,.PrimaryURL,.Title]|@tsv'
echo

echo CVE + severity
cat $REPORT | jq '.Results[0].Vulnerabilities[]' | jq -r '[.VulnerabilityID,.Severity]|@tsv'
echo

echo CVE + severity + CVSS NVD v3 score
# See https://nvd.nist.gov/vuln-metrics/cvss
cat $REPORT | jq '.Results[0].Vulnerabilities[]' | jq -r '[.VulnerabilityID,.Severity,.CVSS.nvd.V3Score]|@tsv'
echo

echo Select records with severity score greater than 7
cat $REPORT | jq '.Results[0].Vulnerabilities[]|select(.CVSS.nvd.V3Score>7)' | jq -r '[.VulnerabilityID,.PrimaryURL,.Title,.Severity,.CVSS.nvd.V3Score]|@tsv'
echo
