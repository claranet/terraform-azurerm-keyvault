data "azuread_group" "admin_group" {
  display_name = "Admin"
}

module "key_vault" {
  source  = "claranet/keyvault/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
  stack               = var.stack

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id,
  ]

  # WebApp or other applications Object IDs
  reader_objects_ids = [
    var.webapp_service_principal_id
  ]

  # Current user should be here to be able to create keys and secrets
  admin_objects_ids = [
    data.azuread_group.admin_group.id
  ]

  # Specify Network ACLs
  network_acls = {
    bypass         = "None"
    default_action = "Deny"
    ip_rules       = ["10.10.0.0/26", "1.2.3.4/32"]

    virtual_network_subnet_ids = var.subnet_ids
  }
}
