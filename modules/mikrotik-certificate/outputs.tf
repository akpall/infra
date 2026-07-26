output "private_key_pem" {
  value     = resource.tls_private_key.mikrotik.private_key_pem
  sensitive = true
}

output "cert_pem" {
  value = resource.tls_locally_signed_cert.mikrotik.cert_pem
}
