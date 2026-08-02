resource "local_file" "mikrotik_cert" {
  content         = resource.tls_locally_signed_cert.mikrotik.cert_pem
  filename        = "${var.files_dir}/mikrotik.pem"
  file_permission = "0600"
}

resource "local_file" "mikrotik_key" {
  content         = resource.tls_private_key.mikrotik.private_key_pem
  filename        = "${var.files_dir}/mikrotik.key"
  file_permission = "0600"
}

resource "tls_cert_request" "mikrotik" {
  dns_names       = var.dns_names
  ip_addresses    = var.ip_addresses
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
  ca_private_key_pem    = var.private_key_pem
  cert_request_pem      = resource.tls_cert_request.mikrotik.cert_request_pem
  early_renewal_hours   = var.early_renewal_hours
  validity_period_hours = var.validity_period_hours
  ca_cert_pem           = var.cert_pem
}

resource "tls_private_key" "mikrotik" {
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
  rsa_bits    = var.rsa_bits
}
