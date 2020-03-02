#!/usr/bin/env bash

cd "$(dirname ${BASH_SOURCE[0]})"/..
set -euxo pipefail

asdf plugin-add hugo https://github.com/beardix/asdf-hugo.git
asdf plugin-add yarn

# https://github.com/asdf-vm/asdf-nodejs#install
asdf plugin-add nodejs
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
