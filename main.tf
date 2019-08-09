resource "tfe_policy_set" "tags" {
  name                   = "tags-enforced"
  description            = "A brand new policy set"
  organization           = "hashicorp-rachel"
  policies_path          = "policies/my-policy-set"
}
