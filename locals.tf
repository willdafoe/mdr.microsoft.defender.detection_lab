locals {
  config        = yamldecode(file("${path.module}/config/config.yml"))
  address_space = [var.address_space]
  security_rules = [
    {
      name                       = "ssh"
      priority                   = 1001
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      destination_address_prefix = "*"
      description                = "Allow SSH from trusted IP"
    },
    {
      name                       = "rdp"
      priority                   = 1004
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      destination_address_prefix = "*"
      description                = "Allow RDP from trusted IP"
    },
    {
      name                       = "winrm"
      priority                   = 1005
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      destination_address_prefix = "*"
      description                = "Allow WinRM from trusted IP"
    },
    {
      name                       = "windowsATA"
      priority                   = 1006
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      destination_address_prefix = "*"
      description                = "Allow Windows ATA from trusted IP"
    }
  ]
  admin_password = var.admin_password == null ? random_password.admin_password[0].result : var.admin_password
  runner_ip      = !(var.runner_ip == null) ? join("/", [var.runner_ip, "32"]) : null
  use_runner_ip  = var.trusted_ip == local.runner_ip ? false : true
  trusted_ip     = local.use_runner_ip ? null : var.trusted_ip
  trusted_ips    = local.use_runner_ip ? concat(var.trusted_ips, [local.runner_ip, var.trusted_ip]) : null
}