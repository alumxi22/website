# tep-alumni-website

## Development Environment

This project relies on [Hugo](https://gohugo.io/), [Yarn](https://classic.yarnpkg.com/lang/en/), and [Node](https://nodejs.org/en/). The [asdf](https://github.com/asdf-vm/asdf) version manager is used to install and lock all these tools for both local development and CI.

## Basic Dev Instructions

1. Run `git submodule update --init --recursive` if you haven't already done so
1. Install GNU parallel via 'brew install parallel' (macOS) or from https://savannah.gnu.org/projects/parallel/. 🚨 Do not install the version of 'parallel' provided by 'moreutils'! 🚨
1. Install [asdf](https://asdf-vm.com/#/core-manage-asdf-vm?id=install) (make sure to follow the "Add to your Shell" instructions in the installation guide)
1. Run `asdf install just 0.8.1` to get an initial version of `just` on your machine to run the subsequent commands.
1. Run `just add-plugins` to [install all the asdf plugins](./scripts/asdf-add-plugins.sh) specified in [.tool-versions](./tool-versions)
1. Run `just install` to install all the tool versions specified in [.tool-versions](./tool-versions) and [package.json](./package.json)
1. Run `just serve` to locally serve the site and automatically reload on file changes
1. Run `just all` (or just `just`) to
   1. Format and lint all the files in the repository
   1. Render the site to the `docs/` folder
   1. Render the CI pipeline to `.github/workflows/ci.yaml`
1. Create a new branch, commit your changes, and [open a pull request](https://github.com/alumxi22/website/compare). This will run the CI suite which validates your changes.

See https://gohugo.io/documentation/ for more information about Hugo.
