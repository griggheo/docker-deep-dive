#!/bin/bash

REPORT=$1

echo Scan tool info
cat $REPORT |jq '.runs[0].tool.driver.fullName, .runs[0].tool.driver.informationUri,.runs[0].tool.driver.name, .runs[0].tool.driver.version'
echo

echo Result list
cat $REPORT |jq '.runs[0].results'

