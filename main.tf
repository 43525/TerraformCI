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
      name = "TerraformCI-C"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "9734ed68-621d-47ed-babd-269110dbacb1"
}

resource "azurerm_resource_group" "rg" {
  name     = "811-1df69570-provide-continuous-delivery-with-gith"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemyvm2"
  location                 = "eastus"
  resource_group_name      = "811-1df69570-provide-continuous-delivery-with-gith"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
