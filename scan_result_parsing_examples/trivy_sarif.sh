#!/bin/bash

IMAGE=golang:1.16-alpine
#IMAGE=golang:1.17-alpine
#IMAGE=golang:1.18-alpine
#IMAGE=gcr.io/distroless/python3-debian11:latest
REPORT=trivy_report.sarif

trivy image --format sarif -o $REPORT $IMAGE

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
