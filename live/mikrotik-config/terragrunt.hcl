dependency "root-ca" {
  config_path = "../root-ca"
}

dependency "mikrotik-certificate" {
  config_path = "../mikrotik-certificate"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  password_length = 20
  hosturl         = "router.homelab.home.arpa"
  username        = "admin"
  ca_certificate  = dependency.root-ca.outputs.cert_pem
}

terraform {
  source = "${get_repo_root()}/modules/mikrotik-config"
}
