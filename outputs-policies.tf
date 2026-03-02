output "resource_key_vault_access_policy_readers" {
  description = "Key Vault readers access policy."
  value       = azurerm_key_vault_access_policy.readers
}

output "resource_key_vault_access_policy_admins" {
  description = "Key Vault admins access policy."
  value       = azurerm_key_vault_access_policy.admins
}
