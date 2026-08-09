inputs = {
  ignition_dir = "${get_repo_root()}/ignition/"
  files_dir    = "${get_repo_root()}/files/"
}

locals {
  user_ssh_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOpw3cIAdtWOYUkb6UOAIcLuRzItoo4oZMzr/hzZYq4E openpgp:0xFAAA0172"]
}
