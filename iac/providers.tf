terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "ca5c57dd-3aab-4628-a78c-978830d03bbd"   # colonne "SubscriptionId" avec "az account list -o table"
  features {}
}
