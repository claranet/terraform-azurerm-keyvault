variable "client_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "stack" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one."
  type        = string
  default     = ""
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are \"standard\" and \"premium\"."
  type        = string
  default     = "standard"
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "custom_name" {
  description = "Name of the Key Vault, generated if not set."
  type        = string
  default     = ""
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = string
  default     = "false"
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = string
  default     = "false"
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = string
  default     = "false"
}

variable "admin_objects_ids" {
  description = "Ids of the objects that can do all operations on all keys, secrets and certificates"
  type        = list(string)
  default     = []
}

variable "reader_objects_ids" {
  description = "Ids of the objects that can read all keys, secrets and certificates"
  type        = list(string)
  default     = []
}

variable "enable_logs_to_storage" {
  description = "Boolean flag to specify whether the logs should be sent to the Storage Account"
  type        = string
  default     = "false"
}

variable "enable_logs_to_log_analytics" {
  description = "Boolean flag to specify whether the logs should be sent to Log Analytics"
  type        = string
  default     = "false"
}

variable "logs_storage_retention" {
  description = "Retention in days for logs on Storage Account"
  type        = string
  default     = "30"
}

variable "logs_storage_account_id" {
  description = "Storage Account id for logs"
  type        = string
  default     = ""
}

variable "logs_log_analytics_workspace_id" {
  description = "Log Analytics Workspace id for logs"
  type        = string
  default     = ""
}

variable "network_acls" {
  description = "Map object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more informations."
  default     = null

  type = object({
    bypass                     = string,
    default_action             = string,
    ip_rules                   = list(string),
    virtual_network_subnet_ids = list(string),
  })
}
