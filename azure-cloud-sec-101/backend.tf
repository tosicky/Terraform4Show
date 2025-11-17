terraform {
  backend "azurerm" {
    resource_group_name  = "az-sec-101-rg"
    storage_account_name = "azsectfstatestorageacct"
    container_name       = "tfstate"
    key                  = "env/dev/terraform.tfstate"
    use_azuread_auth     = true
  }
}