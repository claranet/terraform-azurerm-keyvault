locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  name     = coalesce(var.custom_name, data.azurecaf_name.key_vault.result)
  hsm_name = coalesce(var.custom_name, data.azurecaf_name.key_vault_hsm.result)
}
