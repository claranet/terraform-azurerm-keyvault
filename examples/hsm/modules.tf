locals {
  hsm_certificates_count = 5
}

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
  reader_objects_ids = var.readers_object_ids

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

module "keyvault_hsm" {
  source  = "claranet/keyvault/azurerm"
  version = "x.x.x"

  client_name    = var.client_name
  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id,
  ]

  resource_group_name = module.rg.resource_group_name
  stack               = var.stack

  managed_hardware_security_module_enabled = true
  public_network_access_enabled            = true

  soft_delete_retention_days = 30

  admin_objects_ids = [
    data.azuread_group.admin_group.id
  ]

  hsm_security_domain_certificates = azurerm_key_vault_certificate.hsm_certs[*].id
  hsm_security_domain_quorum       = 3

}

resource "azurerm_key_vault_certificate" "hsm_certs" {
  count = local.hsm_certificates_count

  key_vault_id = module.key_vault.key_vault_id
  name         = "cert-hsm-${count.index}"
  certificate_policy {
    issuer_parameters {
      name = "Self"
    }
    key_properties {
      exportable = true
      key_type   = "RSA"
      key_size   = 4096
      reuse_key  = false
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pem-file"
    }

    x509_certificate_properties {
      key_usage          = []
      subject            = "CN=contosoo.onmicrosoft.com, C=FR, ST=France, L=Paris, O=Contosoo, OU=IT"
      validity_in_months = 24
    }
  }
}

# trivy:ignore:azure-keyvault-ensure-secret-expiry
resource "azurerm_key_vault_secret" "hsm_security_domain" {
  key_vault_id = module.key_vault.key_vault_id
  name         = "hsm-security-domain"
  value        = module.keyvault_hsm.key_vault_hsm_security_domain
  content_type = "application/json"
}
