output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

output "domain_controller_public_ip" {
  value = module.windows_virtual_machine["domain_controller"].public_ip_address
}