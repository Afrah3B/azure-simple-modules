variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {}
variable "lb_backend_pool_name" {}
variable "lb_backend_address_name" {}
variable "lb_outbound_rule_name" {}
variable "lb_rule_name" {}
variable "frontend_port" {}
variable "backend_port" {}
variable "protocol" {
  type    = string
  default = "Tcp"
}
variable "lb_probe_path" {
  type    = string
  default = "/"
}
variable "frontend_public_ip_address_id" {}
variable "virtual_network_id" {}
variable "backend_ip_addresses" {
  description = "List of backend VM private IP addresses to add to the backend pool."
  type        = list(string)
}
variable "frontend_ip_configuration_name" {}


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
variable "appgw_public_ip_id" {
  type    = string
  default = "/"
}

variable "tags" {
  type = map(string)
}
