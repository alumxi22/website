#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"/..

SHELL_SCRIPTS=()

while IFS='' read -r line; do SHELL_SCRIPTS+=("$line"); done < <(shfmt -f .)

shellcheck --external-sources --source-path="SCRIPTDIR" --color=always "${SHELL_SCRIPTS[@]}"
