resource "azurerm_role_assignment" "key_vault_administrator" {
  for_each = toset(var.rbac_authorization_enabled && !var.managed_hardware_security_module_enabled ? var.admin_objects_ids : [])

  scope                = one(azurerm_key_vault.main[*].id)
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

moved {
  from = azurerm_role_assignment.rbac_keyvault_administrator
  to   = azurerm_role_assignment.key_vault_administrator
}

resource "azurerm_role_assignment" "key_vault_secrets_users" {
  for_each = toset(var.rbac_authorization_enabled && !var.managed_hardware_security_module_enabled ? var.reader_objects_ids : [])

  scope                = one(azurerm_key_vault.main[*].id)
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}

moved {
  from = azurerm_role_assignment.rbac_keyvault_secrets_users
  to   = azurerm_role_assignment.key_vault_secrets_users
}

resource "azurerm_role_assignment" "key_vault_reader" {
  for_each = toset(var.rbac_authorization_enabled && !var.managed_hardware_security_module_enabled ? var.reader_objects_ids : [])

  scope                = one(azurerm_key_vault.main[*].id)
  role_definition_name = "Key Vault Reader"
  principal_id         = each.value
}

moved {
  from = azurerm_role_assignment.rbac_keyvault_reader
  to   = azurerm_role_assignment.key_vault_reader
}
