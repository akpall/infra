resource "tls_private_key" "mikrotik" {
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
  rsa_bits    = var.rsa_bits
}

resource "tls_cert_request" "mikrotik" {
  private_key_pem = resource.tls_private_key.mikrotik.private_key_pem

  dns_names = var.dns_names

  subject {
    common_name  = var.common_name
    organization = var.organization
  }
}

resource "tls_locally_signed_cert" "mikrotik" {
  cert_request_pem   = resource.tls_cert_request.mikrotik.cert_request_pem
  ca_private_key_pem = var.private_key_pem
  ca_cert_pem        = var.cert_pem

  validity_period_hours = 12

  allowed_uses = [
    "digital_signature",
    "key_encipherment",
    "server_auth",
  ]
}
