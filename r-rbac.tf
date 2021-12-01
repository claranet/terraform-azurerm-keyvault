resource "azurerm_role_assignment" "rbac_keyvault_administrator" {
  for_each = var.rbac_authorization_enabled ? toset(var.admin_objects_ids) : null

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_readers" {
  for_each = var.rbac_authorization_enabled ? toset(var.reader_objects_ids) : null

  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Crypto User"
  principal_id         = each.value
}
