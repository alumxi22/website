let GitHubActions = (./imports.dhall).GitHubActions

let prettier = ./jobs/prettier.dhall

let shellcheck = ./jobs/shellcheck.dhall

let shfmt = ./jobs/shfmt.dhall

let checkDocs = ./jobs/check-docs-up-to-date.dhall

let checkPipeline = ./jobs/check-rendered-pipeline-up-to-date.dhall

let dhallFormat = ./jobs/dhall-format.dhall

let dhallLint = ./jobs/dhall-lint.dhall

in  GitHubActions.Workflow::{
    , name = "CI"
    , on = GitHubActions.On::{ push = Some GitHubActions.Push::{=} }
    , jobs = toMap
        { prettier
        , shellcheck
        , shfmt
        , checkDocs
        , dhallFormat
        , dhallLint
        , checkPipeline
        }
    }
