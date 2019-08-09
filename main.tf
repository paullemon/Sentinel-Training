resource "tfe_sentinel_policy" "tags" {
  name         = "tags-enforced"
  description  = "Resources must be tagged"
  organization = "hashicorp-rachel"
  policy       = <<EOT
import "tfplan"

main = rule {
	all tfplan.resources.aws_instance as _, instances {
		all instances as _, r {
			(length(r.applied.tags) else 0) > 0
		}
	}
}EOT
  enforce_mode = "hard-mandatory"
}

