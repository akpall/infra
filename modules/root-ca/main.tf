resource "tls_private_key" "ca" {
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
  rsa_bits    = var.rsa_bits
}

resource "tls_self_signed_cert" "ca" {
  private_key_pem       = tls_private_key.ca.private_key_pem
  is_ca_certificate     = true
  validity_period_hours = var.validity_period_hours
  early_renewal_hours   = var.early_renewal_hours

  subject {
    common_name  = var.common_name
    organization = var.organization
  }

  allowed_uses = [
    "cert_signing",
    "crl_signing",
  ]

  lifecycle {
    prevent_destroy = true
  }
}
