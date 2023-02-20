# Configure the Azure provider
terraform {
  required_providers {
   azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
  required_version = ">= 1.3"
}

provider "azurerm" {
  features {}
}
