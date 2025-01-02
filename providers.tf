terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.14.0, < 5.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }
  ## below block defines the backend that contains tfstate for this deployment
  backend "azurerm" {
    resource_group_name  = "prutfrg"
    storage_account_name = "prutfsa123"
    container_name       = "tfstate"
    key                  = "eslz.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  #   subscription_id = var.subscription_id
  use_oidc = true
}