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

# move management and connectivity subscription to right management groups
data "azurerm_management_group" "mgt" {
  name = "prunc ALZ root"
}

data "azurerm_subscription" "mgtsubscription" {
  subscription_id = "12345678-1234-1234-1234-123456789012"
}

resource "azurerm_management_group_subscription_association" "mgtsubscription_association" {
  management_group_id = data.azurerm_management_group.mgt.id
  subscription_id     = data.terraform_remote_state.stage0a_output.outputs.subscription_id
  depends_on          = [module.alz_architecture]
}