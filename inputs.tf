variable "client_name" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "stack" {
  type = "string"
}

variable "resource_group_name" {
  type = "string"
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = "string"
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = "string"
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault."
  type        = "string"
}

variable "sku" {
  description = "The Name of the SKU used for this Key Vault. Possible values are \"standard\" and \"premium\"."
  type        = "string"
  default     = "standard"
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = "map"
  default     = {}
}

variable "custom_name" {
  description = "Name of the Key Vault, generated if not set."
  type        = "string"
  default     = ""
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = "string"
  default     = "false"
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = "string"
  default     = "false"
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = "string"
  default     = "false"
}

variable "logs_retention" {
  description = "Retention in days for audit logs on Storage Account"
  type        = "string"
  default     = "30"
}

variable "logs_storage_account_name" {
  description = "Storage Account name for database logs"
  type        = "string"
}

variable "logs_storage_account_rg" {
  description = "Storage Account Resource Group name for database logs"
  type        = "string"
}
