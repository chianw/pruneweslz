# pruneweslz

This stage here creates the ESLZ management group hierarchy along with default policies and initiatives. It moves the management and connectivity subscription created in **prunewcloud** stage into the right management groups

This is based on https://registry.terraform.io/modules/Azure/avm-ptn-alz/azurerm/latest 

An alternative to this pattern module is ALZ accelerator - https://github.com/Azure/alz-terraform-accelerator 

Accelerator is not used in this case because it requires Powershell on the runners, creation of a specific folder structure to contain specific files - inputs.yaml and platform-landing-zones.tfvars. This option can be explored if it is of interest.

Documentation for both are available - https://azure.github.io/Azure-Landing-Zones/
