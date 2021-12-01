resource "azurerm_role_assignment" "rbac_keyvault_administrator" {
  for_each = toset(var.rbac_authorization_enabled ? var.admin_objects_ids : [])

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_secrets_readers" {
  for_each = toset(var.rbac_authorization_enabled ? var.reader_objects_ids : [])

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_cryptos_users" {
  for_each = toset(var.rbac_authorization_enabled ? var.reader_objects_ids : [])

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Crypto User"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_certificates_officers" {
  for_each = toset(var.rbac_authorization_enabled ? var.reader_objects_ids : [])

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Certificates Officer"
  principal_id         = each.value
}
