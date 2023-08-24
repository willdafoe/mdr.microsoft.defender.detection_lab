module "resource_group" {
  source      = "app.terraform.io/mdr-team/resource_group/azure"
  version     = "1.0.1"
  enabled     = var.enabled
  name        = var.name
  namespace   = var.namespace
  environment = var.environment
  location    = var.location
  stage       = var.stage
  tags        = local.tags
}

module "virtual_network" {
  source              = "app.terraform.io/mdr-team/virtual_network/azure"
  version             = "1.0.2"
  depends_on          = [module.resource_group]
  enabled             = var.enabled
  name                = var.name
  namespace           = var.namespace
  environment         = var.environment
  location            = var.location
  stage               = var.stage
  resource_group_name = module.resource_group.resource_group_name
  address_space       = local.address_space
  tags                = local.tags
}

module "dynamic_subnets" {
  source              = "app.terraform.io/mdr-team/dynamic_subnets/azure"
  version             = "1.0.1"
  depends_on          = [module.virtual_network]
  enabled             = var.enabled
  name                = var.name
  namespace           = var.namespace
  environment         = var.environment
  location            = var.location
  stage               = var.stage
  subnet_count        = var.subnet_count
  max_subnet_count    = var.max_subnet_count
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.virtual_network.virtual_network_name
  tags                = local.tags
}

module "security_group" {
  source              = "app.terraform.io/mdr-team/security_group/azure"
  version             = "1.0.2"
  depends_on          = [module.resource_group]
  enabled             = var.enabled
  name                = var.name
  namespace           = var.namespace
  environment         = var.environment
  location            = var.location
  stage               = var.stage
  trusted_ip          = var.trusted_ip
  trusted_ips         = !(var.trusted_ips == null) ? var.trusted_ips : null
  resource_group_name = module.resource_group.resource_group_name
  security_rule       = local.security_rules
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  depends_on                = [module.dynamic_subnets, module.security_group]
  subnet_id                 = module.dynamic_subnets.subnet_id
  network_security_group_id = module.security_group.security_group_id
}

module "windows_virtual_machine" {
  # tflint-ignore: null_value
  source              = "app.terraform.io/mdr-team/windows_virtual_machine/azure"
  version             = "1.0.5"
  for_each            = local.config.WINDOWS_VIRTUAL_MACHINE
  enabled             = var.enabled
  name                = var.name
  namespace           = var.namespace
  environment         = var.environment
  location            = var.location
  stage               = var.stage
  publisher           = each.value.publisher
  offer               = each.value.offer
  sku                 = each.value.sku
  vm_instance_count   = each.value.vm_instance_count
  computer_name       = each.value.computer_name
  resource_group_name = module.resource_group.resource_group_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.dynamic_subnets.subnet_id
  os_disk_size_gb     = each.value.os_disk_size_gb
  enable_winrm        = true
  tags = merge(
    each.value.tags,
    local.tags
  )
}

resource "local_file" "inventory" {
  for_each = local.config.WINDOWS_VIRTUAL_MACHINE
  content = templatefile("${path.module}/templates/inventory.tpl", {
    resource_group_name = module.resource_group.resource_group_name
  })
  filename = "${path.module}/ansible/inventory/myazure_rm.yml"
}