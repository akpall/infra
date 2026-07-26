resource "tls_cert_request" "mikrotik" {
  dns_names       = var.dns_names
  private_key_pem = resource.tls_private_key.mikrotik.private_key_pem
  subject {
    common_name  = var.common_name
    organization = var.organization
  }
}

resource "tls_locally_signed_cert" "mikrotik" {
  allowed_uses = [
    "digital_signature",
    "key_encipherment",
    "server_auth",
  ]
  ca_cert_pem           = var.cert_pem
  ca_private_key_pem    = var.private_key_pem
  cert_request_pem      = resource.tls_cert_request.mikrotik.cert_request_pem
  validity_period_hours = 12
}

resource "tls_private_key" "mikrotik" {
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
  rsa_bits    = var.rsa_bits
}
