#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="serving-default"
ENDPOINT="${1:?Usage: $0 <endpoint>}"

OLDDEP=$(
  kubectl get deployment -n "${NAMESPACE}" -o name \
    | grep "${ENDPOINT}-predictor-00001" \
    | head -1
)

if [[ -z "${OLDDEP}" ]]; then
  echo "Deployment not found: ${ENDPOINT}-predictor-00001"
  exit 1
fi

echo "Scaling ${OLDDEP} to 0 replicas..."

kubectl scale "${OLDDEP}" \
  -n "${NAMESPACE}" \
  --replicas=0

echo "Done."
