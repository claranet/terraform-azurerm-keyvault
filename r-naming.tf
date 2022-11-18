data "azurecaf_name" "keyvault" {
  name          = var.stack
  resource_type = "azurerm_key_vault"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.environment, var.location_short, local.name_suffix, var.use_caf_naming ? "" : "kv"])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}
