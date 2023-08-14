variable "enabled" {
  description = "Enable or disable the Defender for Endpoint lab"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the Defender for Endpoint lab"
  type        = string
}

variable "namespace" {
  description = "Namespace of the Defender for Endpoint lab"
  type        = string
}

variable "environment" {
  description = "Environment of the Defender for Endpoint lab"
  type        = string
  default     = null
}

variable "stage" {
  description = "Stage of the Defender for Endpoint lab"
  type        = string
  default     = null
}

variable "location" {
  description = "Location of the Defender for Endpoint lab"
  type        = string
}

variable "address_space" {
  description = "Address space of the Defender for Endpoint lab"
  type        = string
  default     = "192.168.10.0/23"
}

variable "subnet_count" {
  description = "Number of subnets in the Defender for Endpoint lab"
  type        = number
  default     = 1
}

variable "max_subnet_count" {
  description = "Maximum number of subnets in the Defender for Endpoint lab"
  type        = number
  default     = 0
}

variable "trusted_ip" {
  description = "Trusted IP address of the Defender for Endpoint lab"
  type        = string
  default     = null
}

variable "admin_username" {
  description = "Admin username of the Defender for Endpoint lab"
  type        = string
  default     = "sophosAdmin"
}

variable "admin_password" {
  description = "Admin password of the Defender for Endpoint lab"
  type        = string
  default     = null
  sensitive   = true
}