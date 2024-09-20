variable "managed_hardware_security_module_enabled" {
  description = "Create a KeyVault Managed HSM resource if enabled. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "hsm_security_domain_certificates" {
  description = "List of keyvault certificates ids to be used as security domain certificates."
  type        = list(string)
  default     = null
}

variable "hsm_security_domain_quorum" {
  description = "Number of security domain certificates needed to perform operations."
  type        = number
  default     = null
}
