terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}

resource "random_password" "password" {
  length  = var.password_length
  special = true
}

provider "routeros" {
  hosturl        = var.hosturl
  username       = var.username
  password       = resource.random_password.password
  ca_certificate = var.ca_certificate
}

output "password" {
  value     = resource.random_password.password.result
  sensitive = true
}
