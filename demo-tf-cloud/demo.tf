terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "remote" {
      organization = "Nibelungos"
      workspaces {
        name = "HashiTalks-Latam-2021"
      }
    }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "rg-state-tfcloud-hashitalks"
  location = "eastus2"
}

resource "azurerm_storage_account" "example" {
  name                     = "storaccounttfcloud"
  resource_group_name      = azurerm_resource_group.state-demo-secure.name
  location                 = azurerm_resource_group.state-demo-secure.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    evento = "hashitalk 2021"
  }
}