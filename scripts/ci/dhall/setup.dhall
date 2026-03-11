let GitHubActions = (./imports.dhall).GitHubActions

let ASDFSteps =
      [ GitHubActions.Step::{
        , name = Some "Install asdf"
        , uses = Some "asdf-vm/actions/setup@v1.0.1"
        }
      , GitHubActions.Step::{
        , name = Some "Install asdf plugins"
        , run = Some "scripts/asdf-add-plugins.sh"
        }
      , GitHubActions.Step::{
        , name = Some "Install asdf tools versions"
        , run = Some "scripts/ci/asdf-install.sh"
        }
      , GitHubActions.Step::{
        , name = Some "Install node packages"
        , run = Some "yarn install"
        }
      ]

let Checkout =
      GitHubActions.Step::{
      , name = None Text
      , `with` = Some (toMap { submodules = "recursive" })
      , uses = Some "actions/checkout@master"
      }

let SetupSteps = [ Checkout ] # ASDFSteps

let Job =
      { Type = GitHubActions.Job.Type
      , default =
          GitHubActions.Job.default
        with runs-on = GitHubActions.RunsOn.Type.ubuntu-latest
        with steps = Some SetupSteps
      }

in  { SetupSteps, Job }
