#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/../..
set -euxo pipefail

scripts/ci/render-ci-pipeline.sh

git diff --exit-code .github/workflows/ci.yaml
