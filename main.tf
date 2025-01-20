/*
data "terraform_remote_state" "stage0a_output" {
  backend = "azurerm"

  config = {
    resource_group_name  = "prutfinitrg"
    storage_account_name = "prutfinitsa"
    container_name       = "tfstate"
    key                  = "stage0a.tfstate"
  }
}


data "terraform_remote_state" "stage0b_output" {
  backend = "azurerm"

  config = {
    resource_group_name  = "prutfinitrg"
    storage_account_name = "prutfinitsa"
    container_name       = "tfstate"
    key                  = "stage0b.tfstate"
  }
}
*/

data "azurerm_client_config" "current" {
}

# This allows us to get the tenant id
data "azapi_client_config" "current" {}

module "alz_architecture" {
  source             = "git::https://github.com/Azure/terraform-azurerm-avm-ptn-alz.git?ref=v0.10.0"
  architecture_name  = "custom"
  parent_resource_id = data.azapi_client_config.current.tenant_id
  location           = "eastasia"
}