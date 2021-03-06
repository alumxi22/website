all: build format lint

build: render-hugo render-ci

render-hugo: format lint
    hugo

render-ci: dhall-format dhall-lint
    ./scripts/ci/render-ci-pipeline.sh

format: dhall-format prettier shfmt

lint: dhall-lint

prettier:
    yarn run prettier

dhall-format:
    ./scripts/dhall-format.sh

dhall-lint:
    ./scripts/dhall-lint.sh

shfmt:
    ./scripts/shfmt.sh

serve:
    hugo serve -D

asdf-add-plugins:
    ./scripts/ci/asdf-add-plugins.sh

install: yarn-install

yarn-install:
    yarn install
