terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "igw"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "80ea84e8-afce-4851-928a-9e2219724c69"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-b86e2a51-playground-sandbox"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemyvm1"
  location                 = "eastus"
  resource_group_name      = "azurerm_resource_group.rg.name"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
