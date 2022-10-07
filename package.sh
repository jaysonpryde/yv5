#!/bin/bash
set -e

VERSION=${1:-latest}
IMAGE="yv5_demo"

docker build -f package.dockerfile -t ${IMAGE}:${VERSION} .
