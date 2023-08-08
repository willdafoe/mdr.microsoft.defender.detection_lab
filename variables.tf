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
  type    = string
  default = null
}

variable "stage" {
  type    = string
  default = null
}

variable "location" {
  type = string
}

variable "address_space" {
  type = string
}

variable "subnet_count" {
  type    = number
  default = 1
}

variable "max_subnet_count" {
  type    = number
  default = 0
}