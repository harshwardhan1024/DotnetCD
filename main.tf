terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name = "TerraformBackend-RG"
    storage_account_name = "rs9tfbackendstorageacc"
    container_name = "default"
    key = "terraform.tfstate"
    access_key = "Q7yphjXaTEvXp0mAe661QXCXLlhAcDp0U/iszZPen0Pt/hYc3LqXztceq1xsSakcT7Xg9RkOamODuBpyhZQKlQ=="
  }
}

provider "random" {

}

resource "random_uuid" "uuid" {}

resource "random_pet" "pet" {}