terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }

  backend "azurerm" {
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "DotnetCD-RG-${var.branch_name}"
    location = "Central India"
}

resource "azurerm_app_service_plan" "asp" {
    name = "DotnetCD-ASP-${var.branch_name}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    sku {
        tier = var.app_service_plan_sku.tier
        size = var.app_service_plan_sku.size
    }
}

resource "azurerm_app_service" "as" {
    name                = "DotnetCD-AS-${var.branch_name}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.asp.id

    site_config {
        dotnet_framework_version = "v5.0"
        use_32_bit_worker_process = var.app_service_site_config_use_32_bit_worker_process
    }
}