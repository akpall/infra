include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/modules/mikrotik-certificate"
}

inputs = {
  common_name           = "homelab mikrotik certificate"
  organization          = "akpall"
  validity_period_hours = 47 * 24
  cert_pem              = dependency.root-ca.outputs.cert_pem
  private_key_pem       = dependency.root-ca.outputs.private_key_pem
  early_renewal_hours   = 7 * 24
  dns_names             = ["router.homelab.home.arpa"]
}

dependency "root-ca" {
  config_path = "../root-ca"
}
