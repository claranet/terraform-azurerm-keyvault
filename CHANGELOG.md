# v7.2.0 - 2022-11-29

Add
  * [GH-1](https://github.com/claranet/terraform-azurerm-keyvault/pull/1): Add `public_network_access_enabled` parameter

# v7.1.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v7.0.1 - 2022-11-14

Fixed
  * AZ-901: Fix ACL default behavior

# v7.0.0 - 2022-11-10

Added
  * AZ-901: Add `soft_delete_retention_days` variable

Breaking
  * AZ-901: Require Terraform 1.3+

# v6.0.0 - 2022-09-30

Breaking
  * AZ-839: Require Terraform 1.1+ and AzureRM provider `v3.22+`
  * AZ-839: Bump `diagnostics` module

# v5.1.0 - 2022-02-03

Added
  * AZ-615: Add an option to enable or disable default tags

# v5.0.0 - 2022-01-13

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

# v4.5.0 - 2021-12-28

Added
  * AZ-609: Add `enable_rbac_authorization` parameter
  * AZ-609: Configure readers and admins role assignments when using RBAC authorization

# v4.4.2 - 2021-10-26

Changed
  * AZ-572: Revamp examples and improve CI

Fixed
  * AZ-589: Avoid plan drift when specifying Diagnostic Settings categories

# v4.4.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.4.0 - 2021-05-21

Changed
  * AZ-160: Change `logs_destinations_ids`, must be mandatory
  * AZ-495: Module code upgrade, now compatible with Terraform `0.15+`

# v4.3.1 - 2021-04-26

Changed
  * AZ-160: Fix default logs retention

# v4.3.0 - 2021-04-21

Breaking
  * AZ-482: `soft_delete_enabled` is now deprecated since provider [v2.42.0](https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG-v2.md#2420-january-08-2021) and should be removed from this module.
  * AZ-160: Unify diagnostics settings on all Claranet modules

# v4.2.0 - 2021-03-09

Changed
  * AZ-458: Normalizing the casing of the permissions to comply with provider changes https://github.com/terraform-providers/terraform-provider-azurerm/pull/10593

# v4.1.0 - 2021-01-15

Changed
  * AZ-398: Force lowercase on default generated name

# v3.0.1/v4.0.0 - 2020-11-02

Added
  * AZ-248: Force `soft_delete_enabled` value to `true`, add a parameter for `purge_protection_enabled`

Changed
  * AZ-273: Update README and CI, module compatible Terraform 0.13+ (now requires Terraform 0.12.26 minimum version)

# v2.2.0/v3.0.0 - 2020-07-13

Breaking
  * AZ-206: Update README, module compatible both AzureRM provider < 2.0 and >= 2.0 + update variables types

# v2.1.1 - 2020-04-02

Changed
  * AZ-197: Fix README
  * AZ-209: Include Gitlab CI template

# v2.1.0 - 2019-12-20

Added
  * AZ-132: Option to customize Keyvault Network ACLs

# v2.0.1 - 2019-10-07

Changed
  * AZ-119: Revamp README and publish this module to Terraform registry
  * AZ-94: Fix `for_each` with null values thanks to Terraform 0.12.9

Added
  * AZ-119: Add CONTRIBUTING.md doc and `terraform-wrapper` usage with the module

# v2.0.0 - 2019-09-06

Breaking
  * AZ-94: Terraform 0.12 / HCL2 format

Added
  * AZ-118: Add LICENSE, NOTICE & Github badges

# v1.1.0 - 2019-06-18

Changed
  * AZ-98: Make KeyVault tenant id input optional

# v1.0.0 - 2019-05-02

Added
  * AZ-71: First version
