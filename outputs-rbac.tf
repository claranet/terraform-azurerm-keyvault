output "resource_role_assignment_key_vault_administrator" {
  description = "Role assignment for Key Vault Administrator."
  value       = azurerm_role_assignment.key_vault_administrator
  sensitive   = true
}

output "resource_role_assignment_key_vault_secrets_users" {
  description = "Role assignment for Key Vault Secrets User."
  value       = azurerm_role_assignment.key_vault_secrets_users
  sensitive   = true
}

output "resource_role_assignment_key_vault_reader" {
  description = "Role assignment for Key Vault Reader."
  value       = azurerm_role_assignment.key_vault_reader
  sensitive   = true
}
