terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
    features {}
  # Configuration options
}

variable "location" {
    type = string
    default = "East US 2"
    
}

resource "azurerm_resource_group" "dev-app-rm" {

    name = "dev_app"
    location = var.location
  
}

resource "azurerm_virtual_network" "dev-app-vn" {

    name = "dev-app-vm"
    resource_group_name = azurerm_resource_group.dev-app-rm.name
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.dev-app-rm.location
  

    tags = {
      "env" = "dev"
    }
  
}