resource "azurerm_key_vault" "keyvault" {
  name = local.name

  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = local.tenant_id

  sku_name = var.sku_name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  purge_protection_enabled = var.purge_protection_enabled

  dynamic "network_acls" {
    for_each = var.network_acls == null ? [] : list(var.network_acls)
    iterator = acl
    content {
      bypass                     = coalesce(acl.value.bypass, "None")
      default_action             = coalesce(acl.value.default_action, "Deny")
      ip_rules                   = acl.value.ip_rules
      virtual_network_subnet_ids = acl.value.virtual_network_subnet_ids
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
