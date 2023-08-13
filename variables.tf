variable "enabled" {
  type    = bool
  default = true
}

variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "environment" {
  default = null
}

variable "stage" {
  default = null
}

variable "location" {
  type = string
}

variable "address_space" {
  type    = string
  default = "192.168.10.0/23"
}

variable "subnet_count" {
  type    = number
  default = 1
}

variable "max_subnet_count" {
  type    = number
  default = 0
}

variable "trusted_ip" {
  type    = string
  default = null
}

variable "admin_username" {
  type    = string
  default = "sophosAdmin"
}

variable "admin_password" {
  type      = string
  default   = null
  sensitive = true
}