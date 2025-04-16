variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "account_replication_type" {

  type = string

  default = "LRS"

}

variable "account_tier" {

  type = string

  default = "Standard"

}

variable "storage_account_name" {
  type = string
}
