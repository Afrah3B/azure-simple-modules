resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "sqldb" {
  name                = var.sql_db_name
  server_id           = azurerm_mssql_server.server.id
  sku_name  = "Basic"
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name             = var.mssql_firewall_rule_name
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = var.mssql_firewall_rule_ip_address
  end_ip_address   = var.mssql_firewall_rule_ip_address
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  tags = var.tags
}

