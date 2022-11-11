#!/bin/bash

SBOM_FILE=$1

bomber scan $SBOM_FILE

# for HTML output
#bomber scan $SBOM_FILE --output=html
