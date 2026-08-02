include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  mikrotik_password_length = 20
}

terraform {
  source = "${get_repo_root()}/modules/passwords"
}
