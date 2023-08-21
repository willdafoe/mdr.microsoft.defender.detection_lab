output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

output "domain_controller_public_ip" {
  value = module.windows_virtual_machine["domain_controller"].public_ip_address
}

#output "domain_controller_ip" {
#  value = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, #"domain_controller", null) == null) ? { for k, instance in module.#windows_virtual_machine["domain_controller"] : k => instance.#public_ip_address } : null
#}

#output "windows_server_ip" {
#  value = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, "windows_server", null) == null) ? { for k, instance in module.windows_virtual_machine["windows_server"] : k => instance.public_ip_address } : null
#}

#output "windows_client_ip" {
#  value = !(lookup(local.config.WINDOWS_VIRTUAL_MACHINE, "windows_client", null) == null) ? { for k, instance in module.windows_virtual_machine["windows_client"] : k => instance.public_ip_address } : null
#}