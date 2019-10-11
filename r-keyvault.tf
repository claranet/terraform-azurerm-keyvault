resource "azurerm_key_vault" "keyvault" {
  name = local.name

  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = local.tenant_id

  sku_name = var.sku_name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  dynamic "network_acls" {
    for_each = list(var.network_acls)
    iterator = acl
    content {
      bypass                     = acl.value["bypass"]
      default_action             = acl.value["default_action"]
      ip_rules                   = acl.value["ip_rules"] == "" ? null : split(",", acl.value["ip_rules"])
      virtual_network_subnet_ids = acl.value["virtual_network_subnet_ids"] == "" ? null : split(",", acl.value["virtual_network_subnet_ids"])
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

