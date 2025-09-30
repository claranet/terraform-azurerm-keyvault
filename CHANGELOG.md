## 8.1.1 (2025-09-30)

### Code Refactoring

* **deps:** 🔗 update claranet/azurecaf to ~> 1.3.0 🔧 ef59958

### Miscellaneous Chores

* **⚙️:** ✏️ update template identifier for MR review 3123f6f
* 🗑️ remove old commitlint configuration files 28f8003
* **deps:** 🔗 bump AzureRM provider version to v4.31+ 6a99e39
* **deps:** update dependency claranet/diagnostic-settings/azurerm to ~> 8.1.0 04b4388
* **deps:** update dependency opentofu to v1.10.0 36b52c6
* **deps:** update dependency opentofu to v1.10.1 1cb02b1
* **deps:** update dependency opentofu to v1.10.3 6f83259
* **deps:** update dependency opentofu to v1.10.6 e77da63
* **deps:** update dependency tflint to v0.58.0 973a828
* **deps:** update dependency tflint to v0.58.1 25e9b9e
* **deps:** update dependency tflint to v0.59.1 a83cf91
* **deps:** update dependency trivy to v0.63.0 5ec86ff
* **deps:** update dependency trivy to v0.66.0 530d933
* **deps:** update dependency trivy to v0.67.0 768700c
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v6 c4d5aa6
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.1 ad281d8
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 8.2.0 e981d9d
* **deps:** update tools a6de55c
* **deps:** update tools 58e3480
* **deps:** update tools 92f2254

## 8.1.0 (2025-05-23)

### Features

* **AZ-1561:** add key permissions for admin policy 3c55138

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.6 81cd71f
* **deps:** update dependency opentofu to v1.8.8 6bd3721
* **deps:** update dependency opentofu to v1.9.0 da0527d
* **deps:** update dependency opentofu to v1.9.1 f6e3ada
* **deps:** update dependency pre-commit to v4.1.0 6c1ebc9
* **deps:** update dependency pre-commit to v4.2.0 2fbdd95
* **deps:** update dependency terraform-docs to v0.20.0 0968099
* **deps:** update dependency tflint to v0.54.0 0a5d1d5
* **deps:** update dependency tflint to v0.55.0 c9a800d
* **deps:** update dependency tflint to v0.57.0 45ec35d
* **deps:** update dependency trivy to v0.57.1 4a6443a
* **deps:** update dependency trivy to v0.58.1 98bfb3d
* **deps:** update dependency trivy to v0.58.2 9e54afe
* **deps:** update dependency trivy to v0.59.1 029c5a2
* **deps:** update dependency trivy to v0.60.0 9beaf8f
* **deps:** update dependency trivy to v0.61.1 a021081
* **deps:** update dependency trivy to v0.62.0 7dcbb7e
* **deps:** update dependency trivy to v0.62.1 1f42a9b
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 2230231
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 1e531cc
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 149c99e
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.22.0 eaa4c40
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.0 405d754
* **deps:** update tools 16b9047
* **deps:** update tools b6a06b0
* **deps:** update tools 588b7f3
* **deps:** update tools 6d5a801
* update Github templates cb754fa
* update tflint config for v0.55.0 4849619

## 8.0.1 (2024-10-30)

### Bug Fixes

* **AZ-1088:** keep only latest moved block e10c10c

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.4 95b6536

## 8.0.0 (2024-10-18)

### ⚠ BREAKING CHANGES

* **AZ-1088:** rework module

### Features

* **AZ-1088:** rework module 57b1014

### Documentation

* **AZ-1088:** fix `logs_destinations_ids` variable description af4c4b1

### Continuous Integration

* **AZ-1088:** revert ci to master branch bff4414

### Miscellaneous Chores

* **AZ-1088:** apply suggestions a01134d
* **deps:** update dependency opentofu to v1.8.3 8ca88d5
* **deps:** update dependency pre-commit to v4 b05ecec
* **deps:** update dependency trivy to v0.56.2 3071637
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 4cf405d
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 5453626
* prepare for new examples structure 3410262
* update examples structure 5a31adf

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
