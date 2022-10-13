# Configure the Azure provider
terraform {
#  backend "azurerm" {
#  }
  
  required_providers {
   azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azurerm" {
  features {}
}