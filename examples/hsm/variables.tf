variable "azure_region" {
  description = "Azure region to use."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "webapp_service_principal_id" {
  description = "Service Principal ID for the Webapp"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to authorize in KeyVault Network ACLs"
  type        = list(string)
}
