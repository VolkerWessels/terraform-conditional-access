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
  required_version = ">= 1.2"
  experiments      = [module_variable_optional_attrs]
}

provider "azurerm" {
  features {}
}