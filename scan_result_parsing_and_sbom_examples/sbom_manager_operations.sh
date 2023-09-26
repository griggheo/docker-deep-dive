#!/bin/bash

# initialize DB
sbom-manager -I

SBOM_FILE=~/code/sbom-utility-github/examples/cyclonedx/BOM/juice-shop-11.1.2/bom.json
PROJECT=juice-shop
sbom-manager -a $SBOM_FILE -t cyclonedx -p $PROJECT
sbom-manager -l module -p $PROJECT
sbom-manager -m uri-j -p $PROJECT
