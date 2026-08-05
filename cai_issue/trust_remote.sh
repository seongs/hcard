#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="serving-default"
ENDPOINT="${1:?Usage: $0 <endpoint>}"

kubectl patch isvc "${ENDPOINT}" \
  -n "${NAMESPACE}" \
  --type='json' \
  -p='[
    {
      "op":"add",
      "path":"/spec/predictor/model/args/-",
      "value":"--trust_remote_code"
    }
  ]'

echo "Patched ${ENDPOINT} with --trust_remote_code"
