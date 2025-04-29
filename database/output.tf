output "sql_server_id" {
  description = "The ID of the created SQL Server"
  value       = azurerm_mssql_server.server.id
}

output "sql_database_id" {
  description = "The ID of the created SQL Database"
  value       = azurerm_mssql_database.sqldb.id
}

output "storage_account_id" {
  description = "The ID of the created Storage Account"
  value       = azurerm_storage_account.storage.id
}
