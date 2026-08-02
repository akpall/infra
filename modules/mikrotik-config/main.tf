provider "routeros" {
  ca_certificate = var.ca_certificate
  password       = var.password
  username       = var.username
  hosturl        = var.hosturl
}

resource "routeros_interface_bridge" "bridge" {
  auto_mac = true
  name     = "bridge"
}

terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}
