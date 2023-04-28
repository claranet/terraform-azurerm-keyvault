# Azure Key Vault feature
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/keyvault/azurerm/)

This Terraform module creates an [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/)
with "reader" and "admin" pre-configured [Access policies](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-secure-your-key-vault#data-plane-and-access-policies)
and [Diagnostic settings](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-logging)
enabled.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

data "azuread_group" "admin_group" {
  display_name = "Admin"
}

module "logs" {
  source  = "claranet/run/azurerm//modules/logs"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
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
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2, >= 1.2.22 |
| azurerm | ~> 3.36 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 6.4.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.admin_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.readers_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_managed_hardware_security_module.keyvault_hsm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_managed_hardware_security_module) | resource |
| [azurerm_role_assignment.rbac_keyvault_administrator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rbac_keyvault_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rbac_keyvault_secrets_users](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurecaf_name.keyvault](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.keyvault_hsm](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |
| [azurerm_client_config.current_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_objects\_ids | IDs of the objects that can do all operations on all keys, secrets and certificates. | `list(string)` | `[]` | no |
| client\_name | Client name | `string` | n/a | yes |
| custom\_diagnostic\_settings\_name | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| custom\_name | Name of the Key Vault, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| enabled\_for\_deployment | Whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the Key Vault. | `bool` | `false` | no |
| enabled\_for\_disk\_encryption | Whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| enabled\_for\_template\_deployment | Whether Azure Resource Manager is permitted to retrieve secrets from the Key Vault. | `bool` | `false` | no |
| environment | Environment name | `string` | n/a | yes |
| extra\_tags | Extra tags to add. | `map(string)` | `{}` | no |
| location | Azure location for Key Vault. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br>If you want to specify an Azure EventHub to send logs and metrics to, you need to provide a formated string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the `|` character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| logs\_retention\_days | Number of days to keep logs on storage account. | `number` | `30` | no |
| managed\_hardware\_security\_module\_enabled | Create a KeyVault Managed HSM resource if enabled. Changing this forces a new resource to be created. | `bool` | `false` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| network\_acls | Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. Set to `null` to disable. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more information. | <pre>object({<br>    bypass                     = optional(string, "None"),<br>    default_action             = optional(string, "Deny"),<br>    ip_rules                   = optional(list(string)),<br>    virtual_network_subnet_ids = optional(list(string)),<br>  })</pre> | `{}` | no |
| public\_network\_access\_enabled | Whether the Key Vault is available from public network. | `bool` | `false` | no |
| purge\_protection\_enabled | Whether to activate purge protection. | `bool` | `true` | no |
| rbac\_authorization\_enabled | Whether the Key Vault uses Role Based Access Control (RBAC) for authorization of data actions instead of access policies. | `bool` | `false` | no |
| reader\_objects\_ids | IDs of the objects that can read all keys, secrets and certificates. | `list(string)` | `[]` | no |
| resource\_group\_name | Resource Group the resources will belong to | `string` | n/a | yes |
| sku\_name | The Name of the SKU used for this Key Vault. Possible values are "standard" and "premium". | `string` | `"standard"` | no |
| soft\_delete\_retention\_days | The number of days that items should be retained for once soft-deleted. This value can be between `7` and `90` days. | `number` | `7` | no |
| stack | Stack name | `string` | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one. | `string` | `""` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `custom_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_hsm\_uri | The URI of the Key Vault Managed Hardware Security Module, used for performing operations on keys. |
| key\_vault\_id | ID of the Key Vault. |
| key\_vault\_name | Name of the Key Vault. |
| key\_vault\_uri | URI of the Key Vault |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/key-vault/](https://docs.microsoft.com/en-us/azure/key-vault/)
