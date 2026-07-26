include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/ca-root"
}

inputs = {
  common_name           = "akpall's Homelab Root CA"
  organization          = "akpall"
  validity_period_hours = 87600
}
