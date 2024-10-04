## 7.7.0 (2024-10-04)

### Features

* **AZ-1461:** manage security domain certificates 3a34269

### Miscellaneous Chores

* apply suggestion 3c93880
* **AZ-1461:** apply suggestion 1dabebf
* **AZ-1461:** bump min provider version to 3.63 b017cac
* **AZ-1461:** fix typo 23ae2e3
* **AZ-1461:** improve error_message 1250620
* **deps:** update dependency trivy to v0.56.1 bf9a040
* **deps:** update terraform claranet/diagnostic-settings/azurerm to v7 535f948

## 7.6.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider 55fee21

### Documentation

* update README badge to use OpenTofu registry 9e9ebd2
* update README with `terraform-docs` v0.19.0 983cfd3

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] bb44755
* **AZ-1391:** update semantic-release config [skip ci] 2c694c6

### Miscellaneous Chores

* **deps:** add renovate.json 9ec8db7
* **deps:** enable automerge on renovate d3523f2
* **deps:** update dependency opentofu to v1.7.0 e683e0f
* **deps:** update dependency opentofu to v1.7.1 a34781b
* **deps:** update dependency opentofu to v1.7.2 e2a34be
* **deps:** update dependency opentofu to v1.7.3 c356c3b
* **deps:** update dependency opentofu to v1.8.0 4bf5834
* **deps:** update dependency opentofu to v1.8.1 c570a37
* **deps:** update dependency opentofu to v1.8.2 a948f4b
* **deps:** update dependency pre-commit to v3.7.1 375597b
* **deps:** update dependency pre-commit to v3.8.0 27b4d34
* **deps:** update dependency terraform-docs to v0.18.0 8b6ae16
* **deps:** update dependency terraform-docs to v0.19.0 e35a9c0
* **deps:** update dependency tflint to v0.51.0 e5799e0
* **deps:** update dependency tflint to v0.51.1 96dbbf3
* **deps:** update dependency tflint to v0.51.2 c3ed1e0
* **deps:** update dependency tflint to v0.52.0 98150e6
* **deps:** update dependency tflint to v0.53.0 824d7f6
* **deps:** update dependency trivy to v0.50.2 2d677a5
* **deps:** update dependency trivy to v0.50.4 1d65cbb
* **deps:** update dependency trivy to v0.51.0 501c9da
* **deps:** update dependency trivy to v0.51.1 0c54033
* **deps:** update dependency trivy to v0.51.2 57c03d0
* **deps:** update dependency trivy to v0.51.4 7433f19
* **deps:** update dependency trivy to v0.52.0 b3a157b
* **deps:** update dependency trivy to v0.52.1 48399ae
* **deps:** update dependency trivy to v0.52.2 79e3071
* **deps:** update dependency trivy to v0.53.0 020b542
* **deps:** update dependency trivy to v0.54.1 26c3e10
* **deps:** update dependency trivy to v0.55.0 74eab9c
* **deps:** update dependency trivy to v0.55.1 1ebb385
* **deps:** update dependency trivy to v0.55.2 4573b9c
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 77601e3
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 cfacd91
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 6a0409d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 9a726b4
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 7c94592
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 78e6ebe
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 e429bab
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 043b273
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 00f0be2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 4020c3e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 e4ccb04
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 95b0a1f
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 82a9797
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 8d01ad5
* **deps:** update renovate.json 2f6b488
* **pre-commit:** update commitlint hook 486ce3c
* **release:** remove legacy `VERSION` file df2dc46

# v7.5.0 - 2023-09-01

Breaking
  * AZ-1153: Remove `retention_days` parameters, it must be handled at destination level now. (for reference: [Provider issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/23051))

# v7.4.2 - 2023-06-16

Fixed
  * AZ-1099: Fix HSM Key Vault naming

# v7.4.1 - 2023-05-24

Fixed
  *  AZ-993: Bump `diagnostics` module, ignore provider v4.0 deprecation warning

# v7.4.0 - 2023-04-14

Breaking
  * AZ-1038: Swap location and env order for KeyVault naming. Use `var.custom_name` to keep your KeyVault when upgrading.

# v7.3.0 - 2023-01-20

Added
  * AZ-944: KeyVault managed HSM support

Changed
  * AZ-944: KeyVault managed HSM requires Terraform AzureRM provider `v3.36+`

# v7.2.1 - 2022-12-20

Fixed
  * AZ-943: Fix README

# v7.2.0 - 2022-11-29

Added
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
