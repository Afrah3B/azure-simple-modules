variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "mssql_server_name" {
  type = string
}

variable "mssql_server_administrator_login" {

  type = string

  default = "azureuser"
}

variable "mssql_server_administrator_login_password" {
  type = string
}

variable "mssql_database_name" {
  type = string
}

variable "mssql_firewall_rule_ip_address" {
  type = string
}