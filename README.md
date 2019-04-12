# Azure Key Vault module

## Purpose
This Terraform module creates an [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/) 
with "reader" and "admin" pre-configured [Access policies](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-secure-your-key-vault#data-plane-and-access-policies) 
and [Diagnostic settings](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-logging) 
enabled.

## Usage
You can use this module by including it this way:
```hcl
module "az-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"

  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  azure_region = "${module.az-region.location}"
  client_name  = "${var.client_name}"
  environment  = "${var.environment}"
  stack        = "${var.stack}"
}

data "azuread_group" "admin_group" {
  name = "Admin"
}

module "key_vault" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/keyvault.git?ref=vX.X.X"

  client_name         = "${var.client_name}"
  environment         = "${var.environment}"
  location            = "${module.az-region.location}"
  location_short      = "${module.az-region.location-short}"
  resource_group_name = "${module.rg.resource_group_name}"
  stack               = "${var.stack}"

  logs_storage_account_name = "${data.terraform_remote_state.run.logs_storage_account_name}"
  logs_storage_account_rg   = "${data.terraform_remote_state.run.resource_group_name}"

  tenant_id = "${var.azure_tenant_id}"
  
  reader_objects_ids = ["${var.webapp_service_principal_id}"]

  # Current user should be here to be able to create keys and secrets
  admin_objects_ids = ["${data.admin_group.id}"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_objects\_ids | Ids of the objects that can do all operations on all keys, secrets and certificates | list | `<list>` | no |
| client\_name |  | string | n/a | yes |
| custom\_name | Name of the Key Vault, generated if not set. | string | `""` | no |
| enabled\_for\_deployment | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | string | `"false"` | no |
| enabled\_for\_disk\_encryption | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | string | `"false"` | no |
| enabled\_for\_template\_deployment | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | string | `"false"` | no |
| environment |  | string | n/a | yes |
| extra\_tags | Extra tags to add | map | `<map>` | no |
| location | Azure location for Key Vault. | string | n/a | yes |
| location\_short | Short string for Azure location. | string | n/a | yes |
| logs\_retention | Retention in days for audit logs on Storage Account | string | `"30"` | no |
| logs\_storage\_account\_name | Storage Account name for database logs | string | n/a | yes |
| logs\_storage\_account\_rg | Storage Account Resource Group name for database logs | string | n/a | yes |
| reader\_objects\_ids | Ids of the objects that can read all keys, secrets and certificates | list | `<list>` | no |
| resource\_group\_name |  | string | n/a | yes |
| sku | The Name of the SKU used for this Key Vault. Possible values are "standard" and "premium". | string | `"standard"` | no |
| stack |  | string | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | Id of the Key Vault |
| key\_vault\_name | Name of the Key Vault |
| key\_vault\_uri | URI of the Key Vault |

## Related documentation
Terraform resource documentation: [https://www.terraform.io/docs/providers/azurerm/r/key_vault.html]

Microsoft Azure documentation: [https://docs.microsoft.com/en-us/azure/key-vault/]
