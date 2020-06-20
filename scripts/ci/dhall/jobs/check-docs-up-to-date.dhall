let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

let SetupSteps = Setup.SetupSteps

let Job = Setup.Job

in  Job::{
    , name = Some "Rendered 'docs/' is up to date"
    , steps =
          SetupSteps
        # [ GitHubActions.Step::{
            , name = Some "Check that 'docs' folder is up to date"
            , run = Some "scripts/ci/check-rendered-site-up-to-date.sh"
            }
          ]
    }
