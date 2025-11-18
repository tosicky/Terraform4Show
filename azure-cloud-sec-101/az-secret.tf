resource "azurerm_key_vault" "app_kv" {
  name                        = "kv-app-prod"
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = ["10.0.0.0/24"]
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.app_kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.app_mi.principal_id

  secret_permissions = [
    "Get", "List", "Set", "Delete"
  ]
}

resource "azurerm_user_assigned_identity" "app_mi" {
  name                = "app-managed-id"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}

resource "azurerm_role_assignment" "kv_get" {
  scope                = azurerm_key_vault.app_kv.id
  role_definition_name = "Key Vault Secrets User"   # least privilege role
  principal_id         = azurerm_user_assigned_identity.app_mi.principal_id
}

resource "azuread_application" "gh_app" {
  display_name = "github-actions-app"
}

resource "azuread_service_principal" "gh_sp" {
    client_id = azuread_application.gh_app.client_id
}

resource "azuread_application_federated_identity_credential" "gh_oidc" {
  application_id = azuread_application.gh_app.object_id
  display_name          = "github-actions-federation"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:myorg/myrepo:ref:refs/heads/main"
}

resource "azurerm_role_assignment" "contributor_assignment" {
    scope                = "/subscriptions/${var.subscription_id}" # Assign at the subscription level
    role_definition_name = "Contributor"
    principal_id         = azuread_service_principal.gh_sp.object_id
}