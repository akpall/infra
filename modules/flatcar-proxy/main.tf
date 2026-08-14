data "ignition_config" "flatcar-proxy" {
  users = [
    data.ignition_user.core.rendered,
  ]
  files = [
    data.ignition_file.static-network.rendered,
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
  filename        = "${var.ignition_dir}/flatcar-proxy.json"
  content         = data.ignition_config.flatcar-proxy.rendered
}

terraform {
  required_providers {
    ignition = {
      source  = "community-terraform-providers/ignition"
      version = ">=2.6.0, <2.7.0"
    }
  }
}

variable "ignition_dir" {}

variable "ssh_authorized_keys" {
  type = list(string)
}

data "ignition_file" "static-network" {
  path = "/etc/systemd/network/00-eth0.network"
  content {
    content = <<-EOT
      [Match]
      Name=eth0

      [Network]
      Address=193.40.103.107/24
      Gateway=193.40.103.1
      DHCP=ipv6
      DHCPPrefixDelegation=yes
      IPv6AcceptRA=yes

      [DHCPv6]
      DUIDType=uuid
      DUIDRawData=4e:b7:b9:ab:4b:9f:4a:5f:bf:5d:bd:b8:3a:04:ce:de
      PrefixDelegationHint=2001:bb8:4008:20c0::/60

      [DHCPPrefixDelegation]
      UplinkInterface=:self
      SubnetId=0
      Token=::1
      Announce=yes
    EOT
  }
}
