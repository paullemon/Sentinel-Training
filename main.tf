resource "tfe_policy_set" "tags" {
  name                   = "tags-enforced"
  description            = "A brand new policy set"
  organization           = "hashicorp-rachel"
  policies_path          = "github.com/tr0njavolta/Sentinel-Training"
}
