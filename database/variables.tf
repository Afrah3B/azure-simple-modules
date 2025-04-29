variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "sql_db_name" {
  description = "The name of the SQL database"
  type        = string
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL server"
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL server"
  type        = string
  sensitive   = true
}

variable "mssql_firewall_rule_name" {
  description = "The name of the SQL firewall rule"
  type = string
}
variable "mssql_firewall_rule_ip_address" {
  type = string
  default = "0.0.0.0"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "account_replication_type" {
  type = string
  default = "LRS"
}

variable "account_tier" {
  type = string
  default = "Standard"
}
variable "tags" {
  type = map(string)
}