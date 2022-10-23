#!/bin/bash

trivy image --format sarif -o report-golang.sarif  golang:1.16-alpine

# Scan tool info
cat report-golang.sarif |jq '.runs[0].tool.driver.fullName, .runs[0].tool.driver.informationUri,.runs[0].tool.driver.name, .runs[0].tool.driver.version'

# CVE list
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[].id'

# CVE + URL
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[]|.id,.helpUri'

# CVE + URL + help text
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[]|.id,.helpUri,.help.text'

# CVE + severity
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[]|.id,.properties."security-severity"'

# CVE + severity + TAGS
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[]|.id,.properties."security-severity",.properties.tags'

# Select records with severity > 7
cat report-golang.sarif |jq '.runs[0].tool.driver.rules[] | select(.properties."security-severity">"7")'
