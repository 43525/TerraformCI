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

