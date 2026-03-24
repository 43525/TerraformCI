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
  subscription_id  = "9734ed68-621d-47ed-babd-269110dbacb1"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-b6ec31fc-playground-sandbox"
  location = "eastus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemyvm1"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
