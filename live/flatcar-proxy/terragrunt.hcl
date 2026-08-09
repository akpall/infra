dependency "ssh-keys" {
  config_path = "../ssh-keys"
}

include "root" {
  expose = true
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  ssh_authorized_keys = flatten([
    include.root.locals.user_ssh_keys,
    dependency.ssh-keys.outputs.terragrunt_public_key
  ])
}

terraform {
  source = "${get_repo_root()}/modules/flatcar-proxy"
}
