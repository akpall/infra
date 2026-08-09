data "ignition_config" "flatcar-proxy" {
  users = [
    data.ignition_user.core.rendered,
  ]
}

data "ignition_user" "core" {
  name                = "core"
  ssh_authorized_keys = var.ssh_authorized_keys
}

output "ignition_config" {
  value = data.ignition_config.flatcar-proxy.rendered
}

resource "local_file" "flatcar-proxy" {
  file_permission = "0600"
  filename        = "${var.files_dir}/flatcar-proxy.json"
  content         = data.ignition_config.flatcar-proxy.rendered
}

terraform {
  required_providers {
    ignition = {
      source = "community-terraform-providers/ignition"
    }
  }
}

variable "files_dir" {}

variable "ssh_authorized_keys" {
  type = list(string)
}
