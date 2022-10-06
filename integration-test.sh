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

#EXPECTED=11
#VERSION=${1:-latest}
#IMAGE="ci_cd_v1"
#SUM=$(docker run ${IMAGE}:${VERSION} 8 3)
#
#if [[ "${SUM}" == "${EXPECTED}" ]]; then
#    echo "Integration test passed"
#else
#    echo "[ERROR] 8 + 3 returned ${SUM}, not ${EXPECTED}" >&2
#    exit 1
#fi

