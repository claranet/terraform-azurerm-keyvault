resource "azurerm_key_vault_managed_hardware_security_module" "keyvault_hsm" {
  count = var.managed_hardware_security_module_enabled ? 1 : 0

  name = local.hsm_name

  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = local.tenant_id

  sku_name = "Standard_B1"

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  admin_object_ids = var.admin_objects_ids

  public_network_access_enabled = var.public_network_access_enabled

  dynamic "network_acls" {
    for_each = var.network_acls == null ? [] : [var.network_acls]
    iterator = acl
    content {
      bypass         = acl.value.bypass
      default_action = acl.value.default_action
    }
  }

  security_domain_key_vault_certificate_ids = var.hsm_security_domain_certificates
  security_domain_quorum                    = var.hsm_security_domain_quorum

  tags = merge(local.default_tags, var.extra_tags)

  lifecycle {
    precondition {
      condition     = (var.hsm_security_domain_certificates != null && var.hsm_security_domain_quorum != null) || (var.hsm_security_domain_certificates == null && var.hsm_security_domain_quorum == null)
      error_message = "All of `security_domain_key_vault_certificate_ids,security_domain_quorum` must be specified."
    }
    precondition {
      condition     = try(length(var.hsm_security_domain_certificates) >= 3 && length(var.hsm_security_domain_certificates) <= 10, true)
      error_message = "`var.hsm_security_domain_certificates` valid values are between 3 and 10."
    }
    precondition {
      condition     = try(var.hsm_security_domain_quorum >= 2 && var.hsm_security_domain_quorum <= 10, true)
      error_message = "`var.hsm_security_domain_quorum` valid values are between 2 and 10."
    }
  }
}
