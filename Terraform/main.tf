# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-dev-centralus-nara-explorer"
    storage_account_name = "sadevnaraexplorer"
    container_name       = "sc-tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

locals {
  resource_group_name = "rg-dev-centralus-nara-explorer"
  location            = "centralus"
}

provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "acr" {
  name                = "crdevcentralusnaraexplorer"
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = "Basic"
}