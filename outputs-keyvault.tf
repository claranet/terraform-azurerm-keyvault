output "id" {
  description = "Key Vault ID."
  value       = one(concat(azurerm_key_vault.main[*].id, azurerm_key_vault_managed_hardware_security_module.main[*].id))
}

output "name" {
  description = "Key Vault name."
  value       = one(concat(azurerm_key_vault.main[*].name, azurerm_key_vault_managed_hardware_security_module.main[*].name))
}

output "uri" {
  description = "URI of the Key Vault."
  value       = one(concat(azurerm_key_vault.main[*].vault_uri, azurerm_key_vault_managed_hardware_security_module.main[*].hsm_uri))
}

output "resource" {
  description = "Key Vault resource object."
  value       = one(concat(azurerm_key_vault.main[*], azurerm_key_vault_managed_hardware_security_module.main[*]))
}

output "hsm_security_domain" {
  description = "The security domain of the Key Vault Managed Hardware Security Module."
  value       = one(azurerm_key_vault_managed_hardware_security_module.main[*].security_domain_encrypted_data)
  sensitive   = true
}
