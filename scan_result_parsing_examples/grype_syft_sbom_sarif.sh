#!/bin/bash
SBOM=syft_sbom.json
REPORT=grype_report.sarif
grype -o sarif --file $REPORT sbom:$SBOM

echo Scan tool info
cat $REPORT |jq '.runs[0].tool.driver.fullName, .runs[0].tool.driver.informationUri,.runs[0].tool.driver.name, .runs[0].tool.driver.version'
echo

echo CVE list
cat $REPORT |jq '.runs[0].tool.driver.rules[].id'
echo

echo CVE + URL
cat $REPORT |jq '.runs[0].tool.driver.rules[]|.id,.helpUri'
echo

echo CVE + URL + help text
cat $REPORT |jq '.runs[0].tool.driver.rules[]|.id,.helpUri,.help.text'
echo

echo CVE + severity
cat $REPORT |jq '.runs[0].tool.driver.rules[]|.id,.properties."security-severity"'
echo

echo Select records with severity score greater than 7
cat $REPORT |jq '.runs[0].tool.driver.rules[] | select(.properties."security-severity">"7")' | jq ".id,.helpUri,.fullDescription.text"
echo
