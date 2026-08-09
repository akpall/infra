output "terragrunt_private_key" {
  sensitive = true
  value     = trimspace(resource.tls_private_key.terragrunt.private_key_pem)
}

output "terragrunt_public_key" {
  value = trimspace(resource.tls_private_key.terragrunt.public_key_openssh)
}

resource "tls_private_key" "terragrunt" {
  algorithm = "ED25519"
}
