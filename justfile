render:  render-hugo render-ci

render-hugo: format lint
    hugo

render-ci: dhall-format dhall-lint
    ./scripts/ci/render-ci-pipeline.sh

format: dhall-format prettier

lint: dhall-lint

prettier:
    yarn run prettier

dhall-format:
    ./scripts/dhall-format.sh

dhall-lint:
    ./scripts/dhall-lint.sh

serve:
    hugo serve -D

install: yarn-install asdf-install

asdf-install:
    asdf install

yarn-install: asdf-install
    yarn
