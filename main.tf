resource "tfe_policy_set" "tags" {
  name                   = "tags-enforced"
  description            = "A brand new policy set"
  organization           = "hashicorp-rachel"
  policies_path          = "policies/my-policy-set"
  workspace_external_ids = ["${tfe_workspace.tags.external_id}"]

  vcs_repo {
    identifier         = "tr0njavolta/my-policy-set-repository"
    branch             = "master"
    ingress_submodules = false
    oauth_token_id     = "${tfe_oauth_client.tags.oauth_token_id}"
  }
}
