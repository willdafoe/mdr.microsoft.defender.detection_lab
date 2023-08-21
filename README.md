# microsoft.defender

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.69.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.69.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic_subnets"></a> [dynamic\_subnets](#module\_dynamic\_subnets) | app.terraform.io/mdr-team/dynamic_subnets/azure | 1.0.1 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | app.terraform.io/mdr-team/resource_group/azure | 1.0.1 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | app.terraform.io/mdr-team/security_group/azure | 1.0.2 |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | app.terraform.io/mdr-team/virtual_network/azure | 1.0.2 |
| <a name="module_windows_virtual_machine"></a> [windows\_virtual\_machine](#module\_windows\_virtual\_machine) | app.terraform.io/mdr-team/windows_virtual_machine/azure | 1.0.3 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.69.0/docs/resources/subnet_network_security_group_association) | resource |
| [local_file.inventory](https://registry.terraform.io/providers/hashicorp/local/2.4.0/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space of the Defender for Endpoint lab | `string` | `"192.168.10.0/23"` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the windows virtual machines | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin username for the windows virtual machines | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable or disable the Defender for Endpoint lab | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment of the Defender for Endpoint lab | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the Defender for Endpoint lab | `string` | n/a | yes |
| <a name="input_max_subnet_count"></a> [max\_subnet\_count](#input\_max\_subnet\_count) | Maximum number of subnets in the Defender for Endpoint lab | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Defender for Endpoint lab | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace of the Defender for Endpoint lab | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage of the Defender for Endpoint lab | `string` | `null` | no |
| <a name="input_subnet_count"></a> [subnet\_count](#input\_subnet\_count) | Number of subnets in the Defender for Endpoint lab | `number` | `1` | no |
| <a name="input_trusted_ip"></a> [trusted\_ip](#input\_trusted\_ip) | Trusted IP address of the Defender for Endpoint lab | `string` | `null` | no |
| <a name="input_trusted_ips"></a> [trusted\_ips](#input\_trusted\_ips) | Trusted IP addresses of the Defender for Endpoint lab | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_controller_public_ip"></a> [domain\_controller\_public\_ip](#output\_domain\_controller\_public\_ip) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
