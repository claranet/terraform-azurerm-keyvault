data "azurerm_storage_account" "logs_storage" {
  name                = "${var.logs_storage_account_name}"
  resource_group_name = "${var.logs_storage_account_rg}"
}

resource "azurerm_key_vault" "keyvault" {
  name = "${local.name}"

  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  # TODO Fetch the current one from an az cli command
  tenant_id = "${var.tenant_id}"

  "sku" {
    name = "${var.sku}"
  }

  enabled_for_deployment          = "${var.enabled_for_deployment}"
  enabled_for_disk_encryption     = "${var.enabled_for_disk_encryption}"
  enabled_for_template_deployment = "${var.enabled_for_template_deployment}"

  tags = "${merge(local.default_tags, var.extra_tags)}"
}

# TODO Manage Log Analytics
resource "azurerm_monitor_diagnostic_setting" "log_settings" {
  name               = "logs"
  target_resource_id = "${azurerm_key_vault.keyvault.id}"

  storage_account_id = "${data.azurerm_storage_account.logs_storage.id}"

  log {
    category = "AuditEvent"

    "retention_policy" {
      enabled = true
      days    = "${var.logs_retention}"
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_key_vault_access_policy" "readers_policy" {
  count = "${length(var.reader_objects_ids)}"

  object_id    = "${element(var.reader_objects_ids, count.index)}"
  tenant_id    = "${var.tenant_id}"
  key_vault_id = "${azurerm_key_vault.keyvault.id}"

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
  count = "${length(var.admin_objects_ids)}"

  object_id    = "${element(var.admin_objects_ids, count.index)}"
  tenant_id    = "${var.tenant_id}"
  key_vault_id = "${azurerm_key_vault.keyvault.id}"

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
