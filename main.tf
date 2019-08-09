provider "tfe" {
  token    = var.token
}

resource "tfe_policy_set" "test" {
  name                   = "my-policy-set"
  description            = "A brand new policy set"
  organization           = "my-org-name"
  policies_path          = "policies/my-policy-set"
  workspace_external_ids = ["${tfe_workspace.test.external_id}"]

  vcs_repo {
    identifier         = "tr0njavolta/Sentinel-Training"
    branch             = "master"
    ingress_submodules = false
    oauth_token_id     = "${tfe_oauth_client.test.oauth_token_id}"
  }
}
