variable "lb_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "frontend_ip_configuration_name" {}
variable "frontend_public_ip_address_id" {}
variable "frontend_ip_configuration_subnet_id" {}
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
