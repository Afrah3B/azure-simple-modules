variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the Virtual Network"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
variable "subnets" {
  description = "List of subnets to create within the Virtual Network"
  type = list(object({
    name            = string
    address_prefix  = string
  }))
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
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

variable "instance_count" {
  description = "Number of NICs to create"
  type        = number
}

variable "public_ip_address_name" {
  type = string
}

variable "ip_allocation_method" {

  type    = string
  default = "Static"

}

variable "nic_name" {
  type = string
}

variable "ip_configuration_name" {
  description = "The name of the NIC IP configuration"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The private IP allocation method for NIC"
  type        = string
  default     = "Dynamic"
}