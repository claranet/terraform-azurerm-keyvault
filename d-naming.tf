data "azurecaf_name" "key_vault" {
  name          = var.stack
  resource_type = "azurerm_key_vault"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix])
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "key_vault_hsm" {
  name          = var.stack
  resource_type = "azurerm_key_vault"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, "hsm"])
  use_slug      = true
  clean_input   = true
  separator     = ""
}
