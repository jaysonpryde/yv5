#!/bin/bash
set -e

echo "Integration test started ..."
EXPECTED=11
VERSION=${1:-latest}
IMAGE="ci_cd_v1"
SUM=$(docker run ${IMAGE}:${VERSION} 8 3)

if [[ "${SUM}" == "${EXPECTED}" ]]; then
    echo "Integration test passed"
else
    echo "[ERROR] 8 + 3 returned ${SUM}, not ${EXPECTED}" >&2
    exit 1
fi

