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

variable "lb_name" {}
variable "frontend_ip_configuration_name" {}
variable "frontend_public_ip_address_id" {}
variable "lb_backend_pool_name" {}
variable "lb_backend_address_name" {}
variable "backend_ip_addresses" {
  description = "List of backend VM private IP addresses to add to the backend pool."
  type        = list(string)
}
variable "virtual_network_id" {}
variable "lb_outbound_rule_name" {}
variable "protocol" {
    type    = string
  default = "Tcp"
}
variable "lb_rule_name" {}
variable "frontend_port" {}
variable "backend_port" {}
variable "lb_probe_path" {
    type    = string
  default = "/"
}


variable "application_gateway_name" {}
variable "gateway_ip_name" {}
variable "gateway_subnet_id" {}
variable "gateway_frontend_port_name" {}
variable "gateway_frontend_port_number" {}
variable "gateway_frontend_ip_configuration" {}
variable "gateway_backend_address_pool_name" {}
variable "gateway_backend_ip_addresses" {
    default = []
}
variable "gateway_backend_http_settings_name" {}
variable "gateway_protocol" {
    type    = string
  default = "Http"
}
variable "gateway_probe_name" {}
variable "gateway_http_listener_name" {}
variable "gateway_routing_rule_name" {}
variable "gateway_probe_host" {}
variable "gateway_probe_path" {}
variable "appgw_public_ip_id" {}