output "id" {
  description = "Key Vault ID."
  value       = one(concat(azurerm_key_vault.main[*].id, azurerm_key_vault_managed_hardware_security_module.main[*].id))
}

output "name" {
  description = "Key Vault name."
  value       = one(concat(azurerm_key_vault.main[*].name, azurerm_key_vault_managed_hardware_security_module.main[*].name))
}

output "uri" {
  description = "URI of the Key Vault"
  value       = one(concat(azurerm_key_vault.main[*].vault_uri, azurerm_key_vault_managed_hardware_security_module.main[*].hsm_uri))
}

output "hsm_security_domain" {
  description = "The security domain of the Key Vault Managed Hardware Security Module."
  value       = one(azurerm_key_vault_managed_hardware_security_module.main[*].security_domain_encrypted_data)
  sensitive   = true
}

output "resource" {
  description = "Key Vault resource object."
  value       = one(concat(azurerm_key_vault.main[*], azurerm_key_vault_managed_hardware_security_module.main[*]))
}

output "module_diagnostics" {
  description = "Diagnostics module output."
  value       = module.diagnostics
}

output "resource_key_vault_access_policy_readers_policy" {
  description = "Key Vault readers access policy."
  value       = azurerm_key_vault_access_policy.readers
}

output "resource_key_vault_access_policy_admin_policy" {
  description = "Key Vault admin access policy."
  value       = azurerm_key_vault_access_policy.admins
}

output "resource_role_assignment_rbac_keyvault_administrator" {
  description = "Role assignment for Key Vault Administrator."
  value       = azurerm_role_assignment.key_vault_administrator
}

output "resource_role_assignment_rbac_keyvault_secrets_users" {
  description = "Role assignment for Key Vault Secrets User."
  value       = azurerm_role_assignment.key_vault_secrets_users
}

output "resource_role_assignment_rbac_keyvault_reader" {
  description = "Role assignment for Key Vault Reader."
  value       = azurerm_role_assignment.key_vault_reader
}
