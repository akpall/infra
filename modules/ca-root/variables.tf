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

variable "organizational_unit" {
  type    = string
  default = null
}

variable "organization" {
  type = string
}

variable "common_name" {
  type = string
}

variable "early_renewal_hours" {
  type    = number
  default = 720
}

variable "validity_period_hours" {
  type    = number
  default = 87600
}
