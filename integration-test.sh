#!/bin/bash
set -e

echo "Integration test started ..."
echo "NOTE: this is just a dummy implementation. Replace the contents of this with real implementation"

EXPECTED="test"
OUTPUT="test"

# place the real implementation/tests here

if [[ "${OUTPUT}" == "${EXPECTED}" ]]; then
    echo "Integration test passed"
else
    echo "[ERROR]: Integration test failed" >&2
    exit 1
fi

