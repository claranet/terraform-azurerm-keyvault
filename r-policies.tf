resource "azurerm_key_vault_access_policy" "readers_policy" {
  count = length(var.reader_objects_ids)

  object_id    = element(var.reader_objects_ids, count.index)
  tenant_id    = local.tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "get",
    "list",
  ]

  secret_permissions = [
    "get",
    "list",
  ]

  certificate_permissions = [
    "get",
    "list",
  ]
}

resource "azurerm_key_vault_access_policy" "admin_policy" {
  count = length(var.admin_objects_ids)

  object_id    = element(var.admin_objects_ids, count.index)
  tenant_id    = local.tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]

  secret_permissions = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]

  certificate_permissions = [
    "backup",
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "restore",
    "setissuers",
    "update",
  ]
}

