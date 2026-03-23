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
      name = "TerraformBcli"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-136c069b-playground-sandbox"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemyvm1"
  location                 = "eastus"
  resource_group_name      = "azurerm_resource_group.rg.name"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
