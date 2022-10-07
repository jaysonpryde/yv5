#!/bin/bash
set -e

VERSION=${1:-latest}
IMAGE="ci_cd_v1"

docker build -f package.dockerfile -t ${IMAGE}:${VERSION} .
