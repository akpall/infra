locals {
  ports = ["ether1", "ether2", "ether3", "ether4", "ether5"]
}

provider "routeros" {
  ca_certificate = var.ca_certificate
  password       = var.password
  username       = var.username
  hosturl        = var.hosturl
}

resource "routeros_interface_bridge" "lan" {
  auto_mac = true
  name     = "lan"
}

resource "routeros_interface_bridge_port" "ether" {
  for_each  = toset(local.ports)
  bridge    = "lan"
  interface = each.key
}

resource "routeros_ipv6_address" "lan_ipv6_address" {
  address   = var.router_ip
  advertise = true
  interface = "lan"
}

terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}
