variable "instance_count" {
  type        = number
  description = "Number of Linux VMs to deploy"
}

variable "virtual_machine_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "network_interface_ids" {
  type        = list(string)
  description = "List of NIC IDs to attach to VMs"
}

variable "vm_size" {
  type = string
  default = "Standard_DS2_v3"
}

variable "os_disk_name" {
  type = string
}

variable "os_disk_caching" {
  type = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type = string
  default = "Premium_LRS"
}

variable "image_publisher" {
  type = string
  default = "Canonical"
}

variable "image_offer" {
  type = string
  default = "ubuntu-24_04-lts"
}

variable "image_sku" {
  type = string
  default = "server"
}

variable "image_version" {
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

variable "tags" {
  type = map(string)
}

variable "nic_name" {
  type = string
}

variable "ip_configuration_name" {
  type = string
}

variable "nic_subnet_ids" {
  description = "List of subnet IDs to assign each NIC"
  type        = list(string)
}

variable "private_ip_address_allocation" {
  type = string
}

variable "public_ip_ids" {
  description = "List of public IP IDs to assign each NIC"
  type        = list(string)
}

variable "network_security_group_id" {
  description = "ID of the Network Security Group to associate with NICs"
  type        = string
}