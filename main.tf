resource "tfe_sentinel_policy" "test" {
  name         = "my-policy-name"
  description  = "This policy always passes"
  organization = "my-org-name"
  policy       = <<EOT
import "tfplan"

main = rule {
	all tfplan.resources.aws_instance as _, instances {
		all instances as _, r {
			(length(r.applied.tags) else 0) > 0
		}
	}
}
EOT
  enforce_mode = "hard-mandatory"
}

