module "diagnostics" {
  # source  = "claranet/diagnostic-settings/azurerm"
  # version = "4.0.3"
  source = "git::ssh://git@git.fr.clara.net/claranet/projects/cloud/azure/terraform/modules/diagnostic-settings.git?ref=AZ-515_caf_naming"

  resource_id = azurerm_key_vault.keyvault.id

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories
  retention_days        = var.logs_retention_days

  use_caf_naming = var.use_caf_naming
  custom_name    = var.custom_diagnostic_settings_name
  name_prefix    = var.name_prefix
  name_suffix    = var.name_suffix
}
