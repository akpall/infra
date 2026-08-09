dependency "mikrotik-certificate" {
  config_path = "../mikrotik-certificate"
}

dependency "network" {
  config_path = "../network"
}

dependency "passwords" {
  config_path = "../passwords"
}

dependency "root-ca" {
  config_path = "../root-ca"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  ca_certificate  = "${get_repo_root()}/files/ca.pem"
  hosturl         = "https://[${dependency.network.outputs.router_ip}]:443"
  password        = dependency.passwords.outputs.mikrotik_password
  router_ip       = "${dependency.network.outputs.router_ip}/64"
  username        = "admin"
  password_length = 20
}

terraform {
  source = "${get_repo_root()}/modules/mikrotik-config"
}
