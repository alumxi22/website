# tep-alumni-website

## Development Environment

This project relies on [Hugo](https://gohugo.io/), [Yarn](https://classic.yarnpkg.com/lang/en/), and [Node](https://nodejs.org/en/). The [asdf](https://github.com/asdf-vm/asdf) version manager is used to install and lock all these tools for both local development and CI.

## Basic Dev Instructions

1. Run `git submodule update --init --recursive` if you haven't already done so
1. Install [asdf](https://asdf-vm.com/#/core-manage-asdf-vm?id=install) (make sure to follow the "Add to your Shell" instructions in the installation guide)
1. Install the following [asdf](https://github.com/asdf-vm/asdf) plugins:

   - [asdf-hugo](https://github.com/beardix/asdf-hugo)
   - [asdf-nodejs](https://github.com/asdf-vm/asdf-nodejs) (remember to follow the guide's instructions to import the Node team's PGP keys)
   - [asdf-yarn](https://github.com/twuni/asdf-yarn)

1. Run `asdf install` to install all the tools specified in [.tool-versions](./tool-versions)
1. Run `hugo server -D` to locally serve the site and automatically reload on file changes
1. Run `hugo` to render the site to the `docs/` folder
1. Create a new branch, commit your changes, and [open a pull request](https://github.com/alumxi22/website/compare). This will run the CI suite which validates your changes.

See https://gohugo.io/documentation/ for more information about Hugo.
