variable "algorithm" {
  type    = string
  default = "RSA"
}

variable "rsa_bits" {
  type    = number
  default = 4096
}

variable "ecdsa_curve" {
  type    = string
  default = "P384"
}

variable "common_name" {
  type = string
}

variable "early_renewal_hours" {
  type = number
}

variable "validity_period_hours" {
  type = number
}

variable "dns_names" {
  type = list(string)
}

variable "organization" {
  type = string
}

variable "private_key_pem" {
  type = string
}

variable "cert_pem" {
  type = string
}
