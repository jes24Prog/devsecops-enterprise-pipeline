#!/usr/bin/env bash
# =====================================================================
# Local DevSecOps Security Scan Suite Execution Script
# =====================================================================
set -euo pipefail

echo "====================================================="
echo " Starting Enterprise Local Security Scanning Suite   "
echo "====================================================="

echo "--> [1/4] Running Gitleaks Secret Scanner..."
if command -v gitleaks &> /dev/null; then
  gitleaks detect --source . --verbose --config .gitleaks.toml
else
  echo "Gitleaks CLI not installed locally. Run via Docker:"
  docker run --rm -v "$(pwd):/path" zricethezav/gitleaks:latest detect --source="/path" --verbose
fi

echo "--> [2/4] Running Semgrep SAST Scanner..."
if command -v semgrep &> /dev/null; then
  semgrep scan --config .semgrep.yml --error
else
  echo "Semgrep CLI not installed. Running via Docker container..."
  docker run --rm -v "$(pwd):/src" returntocorp/semgrep semgrep scan --config=.semgrep.yml --error
fi

echo "--> [3/4] Running Trivy Filesystem Vulnerability Scan..."
if command -v trivy &> /dev/null; then
  trivy fs --severity HIGH,CRITICAL --exit-code 1 .
else
  echo "Trivy CLI not installed. Running via Docker container..."
  docker run --rm -v "$(pwd):/root/src" aquasec/trivy:latest fs --severity HIGH,CRITICAL --exit-code 1 /root/src
fi

echo "--> [4/4] Running Dependency Audit..."
npm audit --audit-level=high

echo "====================================================="
echo " All Local Security Verification Checks Passed Clean! "
echo "====================================================="
