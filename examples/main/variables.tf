variable "azure_region" {
  description = "Azure region to use."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}

# tflint-ignore: terraform_unused_declarations
variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_unused_declarations
variable "subscription_id" {
  description = "Subscription ID."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to authorize in KeyVault Network ACLs."
  type        = list(string)
}

variable "readers_object_ids" {
  description = "Object IDs of the users/groups/identities allowed to read from the Key Vault."
  type        = list(string)
  default     = []
}
