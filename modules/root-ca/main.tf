resource "tls_private_key" "ca" {
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
  rsa_bits    = var.rsa_bits
}

resource "tls_self_signed_cert" "ca" {
  allowed_uses = [
    "cert_signing",
    "crl_signing",
  ]
  early_renewal_hours   = var.early_renewal_hours
  is_ca_certificate     = true
  lifecycle {
    prevent_destroy = true
  }
  private_key_pem       = tls_private_key.ca.private_key_pem
  subject {
    common_name  = var.common_name
    organization = var.organization
  }
  validity_period_hours = var.validity_period_hours
}
