#!/usr/bin/env bash
# build the playground image from the repo root
set -euo pipefail
cd "$(dirname "$0")/.."
docker build -f playground/Dockerfile -t "${PLAYGROUND_IMAGE:-kaputt-playground}" .
