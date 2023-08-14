terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}