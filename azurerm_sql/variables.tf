variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "vnet_name" {
  type = string
}

variable "cidr_block" {

  type    = list(string)
  default = ["10.0.0.0/16"]

}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "public_ip_address" {
  type = string
}

variable "virtual_machine_name" {
  type = string
}

variable "disksize" {
  type    = string
  default = "Standard_DS2_v3"
}

variable "nic_name" {
  type = string
}

variable "nic_subnet_details" {

  description = "Assign subnet to a nic"
  type        = string

}

variable "private_ip_address_allocation" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "security_rule" {

  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string

  }))
}

variable "ip_allocation_method" {

  type    = string
  default = "Static"

}

variable "ip_configuration_name" {

  type = string

}

variable "account_replication_type" {

  type = string

  default = "LRS"

}

variable "account_tier" {

  type = string

  default = "Standard"

}

variable "os_disk_name" {

  type = string
}

variable "os_disk_caching" {

  type    = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {

  type    = string
  default = "Premium_LRS"
}

variable "source_image_reference_publisher" {

  type = string

  default = "Canonical"
}

variable "source_image_reference_offer" {

  type = string

  default = "UbuntuServer"
}

variable "source_image_reference_sku" {

  type = string

  default = "18.04-LTS"
}

variable "source_image_reference_version" {

  type = string

  default = "latest"
}

variable "vm_admin_username" {

  type = string

  default = "azureuser"
}
variable "vm_admin_password" {
  type = string
}

variable "vm_disable_password_authentication" {

  type = bool

  default = true
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

variable "storage_account_name" {
  type = string
}
