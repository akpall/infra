variable "algorithm" {
  default = "RSA"
  type    = string
}

variable "cert_pem" {
  type = string
}

variable "common_name" {
  type = string
}

variable "dns_names" {
  type = list(string)
}

variable "early_renewal_hours" {
  type = number
}

variable "ecdsa_curve" {
  default = "P384"
  type    = string
}

variable "organization" {
  type = string
}

variable "private_key_pem" {
  type = string
}

variable "rsa_bits" {
  default = 4096
  type    = number
}

variable "validity_period_hours" {
  type = number
}
