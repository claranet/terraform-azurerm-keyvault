output "id" {
  description = "ID of the Key Vault."
  value       = one(concat(azurerm_key_vault.main[*].id, azurerm_key_vault_managed_hardware_security_module.main[*].id))
}

output "name" {
  description = "Name of the Key Vault."
  value       = one(concat(azurerm_key_vault.main[*].name, azurerm_key_vault_managed_hardware_security_module.main[*].name))
}

output "uri" {
  description = "URI of the Key Vault"
  value       = one(concat(azurerm_key_vault.main[*].vault_uri, azurerm_key_vault_managed_hardware_security_module.main[*].hsm_uri))
}

output "security_domain" {
  description = "The security domain of the Key Vault Managed Hardware Security Module."
  value       = one(azurerm_key_vault_managed_hardware_security_module.main[*].security_domain_encrypted_data)
  sensitive   = true
}

output "resource_keyvault" {
  description = "Resource outputtf."
  value       = one(concat(azurerm_key_vault.main[*], azurerm_key_vault_managed_hardware_security_module.main[*]))
}

output "module_diagnostics" {
  description = "Module diagnostics outputtf."
  value       = module.diagnostics
}

output "resource_key_vault_access_policy_readers_policy" {
  description = "Keyvault readers access policy."
  value       = azurerm_key_vault_access_policy.readers_policy[*]
}

output "resource_key_vault_access_policy_admin_policy" {
  description = "Keyvault admin access policy."
  value       = azurerm_key_vault_access_policy.admin_policy[*]
}

output "resource_role_assignment_rbac_keyvault_administrator" {
  description = "Role assignment for Key Vault Administrator."
  value       = azurerm_role_assignment.rbac_keyvault_administrator[*]
}

output "resource_role_assignment_rbac_keyvault_secrets_users" {
  description = "Role assignment for Key Vault Secrets User."
  value       = azurerm_role_assignment.rbac_keyvault_secrets_users[*]
}

output "resource_role_assignment_rbac_keyvault_reader" {
  description = "Role assignment for Key Vault Reader."
  value       = azurerm_role_assignment.rbac_keyvault_reader[*]
}
