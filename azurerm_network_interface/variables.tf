variable "instance_count" {
  description = "Number of NICs to create"
  type        = number
}

variable "nic_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "ip_configuration_name" {
  type = string
}

variable "nic_subnet_ids" {
  description = "List of subnet IDs to assign each NIC"
  type        = list(string)
}

variable "public_ip_ids" {
  description = "List of public IP IDs to assign each NIC"
  type        = list(string)
}

variable "private_ip_address_allocation" {
  type = string
}

variable "network_security_group_id" {
  description = "ID of the Network Security Group to associate with NICs"
  type        = string
}

variable "tags" {
  type = map(string)
}
