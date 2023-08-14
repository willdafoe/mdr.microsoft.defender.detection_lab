plugin "azurerm" {
    enabled = true
    version = "0.24.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

config {
  module = false
  ignore_module = {
    "windows_virtual_machine" = true
  }
}

rule "terraform_required_version" {
  enabled = false
}