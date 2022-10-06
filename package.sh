#!/bin/bash
set -e

VERSION=${1:-latest}
IMAGE="yv5"

docker build -f package.dockerfile -t ${IMAGE}:${VERSION} .
