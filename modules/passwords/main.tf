output "mikrotik_password" {
  sensitive = true
  value     = resource.random_password.mikrotik_password.result
}

resource "random_password" "mikrotik_password" {
  special = true
  length  = var.mikrotik_password_length
}
