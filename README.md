# Azure Key Vault feature
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/keyvault/azurerm/)

This Terraform module creates an [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/)
with "reader" and "admin" pre-configured [Access policies](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-secure-your-key-vault#data-plane-and-access-policies)
and [Diagnostic settings](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-logging)
enabled.

## Requirements

* [AzureRM Terraform provider](https://www.terraform.io/docs/providers/azurerm/) >= 1.32

## Terraform version compatibility

| Module version | Terraform version |
|----------------|-------------------|
| >= 2.x.x       | 0.12.9            |
| < 2.x.x        | 0.11.x            |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

You can use this module by including it this way:

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

data "azuread_group" "admin_group" {
  name = "Admin"
}

module "key_vault" {
  source  = "claranet/keyvault/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
  resource_group_name = module.rg.resource_group_name
  stack               = var.stack

  enable_logs_to_storage  = "true"
  logs_storage_account_id = data.terraform_remote_state.run.outputs.logs_storage_account_id

  enable_logs_to_log_analytics    = "true"
  logs_log_analytics_workspace_id = data.terraform_remote_state.run.outputs.log_analytics_workspace_id

  reader_objects_ids = var.webapp_service_principal_id

  # Current user should be here to be able to create keys and secrets
  admin_objects_ids = data.azuread_group.admin_group.id

  # Specify Network ACLs
  network_acls = {
    bypass         = "None"
    default_action = "Deny"
    ip_rules       = "10.10.0.0/26,1.2.3.4/32"

    virtual_network_subnet_ids = join(",", module.subnet.subnet_ids)
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_objects\_ids | Ids of the objects that can do all operations on all keys, secrets and certificates | list(string) | `[]` | no |
| client\_name |  | string | n/a | yes |
| custom\_name | Name of the Key Vault, generated if not set. | string | `""` | no |
| enable\_logs\_to\_log\_analytics | Boolean flag to specify whether the logs should be sent to Log Analytics | string | `"false"` | no |
| enable\_logs\_to\_storage | Boolean flag to specify whether the logs should be sent to the Storage Account | string | `"false"` | no |
| enabled\_for\_deployment | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | string | `"false"` | no |
| enabled\_for\_disk\_encryption | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | string | `"false"` | no |
| enabled\_for\_template\_deployment | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | string | `"false"` | no |
| environment |  | string | n/a | yes |
| extra\_tags | Extra tags to add | map(string) | `{}` | no |
| location | Azure location for Key Vault. | string | n/a | yes |
| location\_short | Short string for Azure location. | string | n/a | yes |
| logs\_log\_analytics\_workspace\_id | Log Analytics Workspace id for logs | string | `""` | no |
| logs\_storage\_account\_id | Storage Account id for logs | string | `""` | no |
| logs\_storage\_retention | Retention in days for logs on Storage Account | string | `"30"` | no |
| network\_acls | Map object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for
more informations. | object | `"null"` | no |
| reader\_objects\_ids | Ids of the objects that can read all keys, secrets and certificates | list(string) | `[]` | no |
| resource\_group\_name |  | string | n/a | yes |
| sku\_name | The Name of the SKU used for this Key Vault. Possible values are "standard" and "premium". | string | `"standard"` | no |
| stack |  | string | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one. | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | Id of the Key Vault |
| key\_vault\_name | Name of the Key Vault |
| key\_vault\_uri | URI of the Key Vault |

## Related documentation

Terraform resource documentation: [terraform.io/docs/providers/azurerm/r/key_vault.html](https://www.terraform.io/docs/providers/azurerm/r/key_vault.html)

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/key-vault/](https://docs.microsoft.com/en-us/azure/key-vault/)
