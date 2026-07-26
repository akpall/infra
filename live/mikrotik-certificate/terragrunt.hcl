dependency "root-ca" {
  config_path = "../root-ca"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  cert_pem              = dependency.root-ca.outputs.cert_pem
  common_name           = "homelab mikrotik certificate"
  dns_names             = ["router.homelab.home.arpa"]
  early_renewal_hours   = 7 * 24
  organization          = "akpall"
  private_key_pem       = dependency.root-ca.outputs.private_key_pem
  validity_period_hours = 47 * 24
}

terraform {
  source = "${get_repo_root()}/modules/mikrotik-certificate"
}
