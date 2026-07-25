#!/usr/bin/env bash
# =====================================================================
# Software Bill of Materials (SBOM) Generation Script
# =====================================================================
set -euo pipefail

IMAGE_NAME="${1:-ghcr.io/your-org/devsecops-backend:latest}"
OUTPUT_FILE="${2:-sbom-spdx.json}"

echo "--> Generating SPDX Software Bill of Materials for container: ${IMAGE_NAME}"

if command -v trivy &> /dev/null; then
  trivy image --format spdx-json --output "${OUTPUT_FILE}" "${IMAGE_NAME}"
else
  docker run --rm -v "$(pwd):/src" aquasec/trivy:latest image --format spdx-json --output "/src/${OUTPUT_FILE}" "${IMAGE_NAME}"
fi

echo "[SUCCESS] SBOM generated successfully at: ${OUTPUT_FILE}"
