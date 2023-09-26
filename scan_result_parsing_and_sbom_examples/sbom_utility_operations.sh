#!/bin/bash

SBOM_UTILITY=~/code/sbom-utility/sbom-utility

$SBOM_UTILITY schema

SBOM_FILE=cyclonedx-sbom.json
$SBOM_UTILITY resource list -i $SBOM_FILE

$SBOM_UTILITY query -i $SBOM_FILE --from metadata.tools
