terraform {
  required_providers {
    ignition = {
      source = "community-terraform-providers/ignition"
    }
  }
}

data "ignition_user" "core" {
  name                = "core"
  ssh_authorized_keys = var.ssh_authorized_keys
}

variable "ssh_authorized_keys" {
  type = list(string)
}

data "ignition_config" "flatcar-proxy" {
  users = [
    data.ignition_user.core.rendered,
  ]
}

output "ignition_config" {
  value = data.ignition_config.flatcar-proxy.rendered
}
