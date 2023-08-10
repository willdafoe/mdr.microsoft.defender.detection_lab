output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_id" {
  value = module.virtual_network.virtual_network_id
}

output "virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.virtual_network.virtual_network_address_space
}

output "subnet_id" {
  value = module.dynamic_subnets.subnet_id
}

output "subnet_name" {
  value = module.dynamic_subnets.subnet_name
}

output "subnet_address_prefixes" {
  value = module.dynamic_subnets.subnet_address_prefixes
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "domain_controller_ip" {
  value = module.windows_virtual_machine["domain_controller"].private_ip_address
}