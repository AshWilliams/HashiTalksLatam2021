terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "RG-AKS-BlueTeam"
        storage_account_name = "dem0azur3hashitalks"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "rg-state-demo-hashitalks"
  location = "eastus2"
}

resource "azurerm_storage_account" "example" {
  name                     = "storaccountterraformdemo"
  resource_group_name      = azurerm_resource_group.state-demo-secure.name
  location                 = azurerm_resource_group.state-demo-secure.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    evento = "hashitalk 2021"
  }
}