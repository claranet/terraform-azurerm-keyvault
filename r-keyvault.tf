resource "azurerm_key_vault" "keyvault" {
  name = "${local.name}"

  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  tenant_id = "${local.tenant_id}"

  sku {
    name = "${var.sku}"
  }

  enabled_for_deployment          = "${var.enabled_for_deployment}"
  enabled_for_disk_encryption     = "${var.enabled_for_disk_encryption}"
  enabled_for_template_deployment = "${var.enabled_for_template_deployment}"

  tags = "${merge(local.default_tags, var.extra_tags)}"
}
