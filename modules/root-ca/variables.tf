variable "algorithm" {
  default = "RSA"
  type    = string
}

variable "common_name" {
  type = string
}

variable "early_renewal_hours" {
  default = 720
  type    = number
}

variable "ecdsa_curve" {
  default = "P384"
  type    = string
}

variable "organization" {
  type = string
}

variable "rsa_bits" {
  default = 4096
  type    = number
}

variable "validity_period_hours" {
  default = 87600
  type    = number
}

variable "files_dir" {
  type = string
}
