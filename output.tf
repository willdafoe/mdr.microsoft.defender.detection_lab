output "module_outputs" {
  value = {
    domain_controller_ip = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, "domain_controller", null) == null) ? module.windows_virtual_machine["domain_controller"].public_ip_address : null
    windows_server_ip    = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, "windows_server", null) == null) ? module.windows_virtual_machine["windows_server"].public_ip_address : null
    windows_client_ip    = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, "windows_client", null) == null) ? module.windows_virtual_machine["windows_client"].public_ip_address : null
    admin_username       = var.admin_username
  }
}