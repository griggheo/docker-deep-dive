#!/bin/bash

echo sbom-scorecard score syft_sbom_spdx.json
sbom-scorecard score syft_sbom_spdx.json

echo sbom-scorecard score trivy_sbom_spdx.json
sbom-scorecard score trivy_sbom_spdx.json
