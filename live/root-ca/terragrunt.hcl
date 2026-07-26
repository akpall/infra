include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  common_name           = "homelab root CA"
  organization          = "akpall"
  validity_period_hours = 87600
}

terraform {
  source = "${get_repo_root()}/modules/root-ca"
}
