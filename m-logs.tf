module "diagnostics" {
  # source  = "claranet/diagnostic-settings/azurerm"
  # version = "~> 8.0.0"

  source = "git::ssh://git@git.fr.clara.net/claranet/projects/cloud/azure/terraform/modules/diagnostic-settings?ref=AZ-1088-rework-module"

  resource_id = one(concat(azurerm_key_vault.main[*].id, azurerm_key_vault_managed_hardware_security_module.main[*].id))

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories

  use_caf_naming = var.use_caf_naming
  custom_name    = var.diagnostic_settings_custom_name
  name_prefix    = var.name_prefix
  name_suffix    = var.name_suffix
}
