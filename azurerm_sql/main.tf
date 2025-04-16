resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mssql_server_administrator_login
  administrator_login_password = var.mssql_server_administrator_login_password
}

resource "azurerm_mssql_database" "mssql_database" {
  name      = var.mssql_database_name
  server_id = azurerm_mssql_server.mssql_server.id
  sku_name  = "Basic"
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name             = "allow-azure-services"
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = var.mssql_firewall_rule_ip_address
  end_ip_address   = var.mssql_firewall_rule_ip_address
}

