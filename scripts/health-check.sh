#!/usr/bin/env bash
# =====================================================================
# Deployment Health & Availability Check Script
# =====================================================================
set -euo pipefail

TARGET_URL="${1:-http://localhost:5000/health}"
MAX_RETRIES=10
RETRY_INTERVAL=3

echo "--> Checking system availability at: ${TARGET_URL}"

for ((i=1; i<=MAX_RETRIES; i++)); do
  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${TARGET_URL}" || true)
  
  if [ "${HTTP_STATUS}" -eq 200 ]; then
    echo "[SUCCESS] System is UP and returning HTTP 200 (Attempt ${i}/${MAX_RETRIES})."
    exit 0
  fi

  echo "[WAIT] Attempt ${i}/${MAX_RETRIES}: Received status ${HTTP_STATUS}. Retrying in ${RETRY_INTERVAL}s..."
  sleep "${RETRY_INTERVAL}"
done

echo "[ERROR] Health check failed after ${MAX_RETRIES} attempts."
exit 1
