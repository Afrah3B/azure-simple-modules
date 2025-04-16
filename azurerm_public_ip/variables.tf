variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "public_ip_address" {
  type = string
}

variable "ip_allocation_method" {

  type    = string
  default = "Static"

}