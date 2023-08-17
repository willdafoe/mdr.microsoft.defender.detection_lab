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

variable "runner_ip" {
  description = "If running via CI/CD, the IP address of the runner"
  type        = string
  default     = null
}

variable "trusted_ips" {
  description = "Trusted IP addresses of the Defender for Endpoint lab"
  type        = list(string)
  default     = []
}

variable "admin_username" {
  description = "Admin username for the windows virtual machines"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the windows virtual machines"
  type        = string
  sensitive   = true
}