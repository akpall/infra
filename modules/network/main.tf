resource "random_id" "ula" {
  byte_length = 5
}

locals {
  sub0    = substr(random_id.ula.hex, 0, 2)
  sub1    = substr(random_id.ula.hex, 2, 4)
  sub2    = substr(random_id.ula.hex, 6, 4)
  network = "fd${local.sub0}:${local.sub1}:${local.sub2}::/48"
}

output "ula_prefix" {
  value = local.network
}

locals {
  home_subnet = cidrsubnet(local.network, 16, 1)
  router_ip   = cidrhost(local.home_subnet, 1)
}

output "home_subnet" {
  value = local.home_subnet
}

output "router_ip" {
  value = local.router_ip
}
