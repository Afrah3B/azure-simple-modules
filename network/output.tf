output "vnet_id" {
  description = "The ID of the created Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
}

output "network_security_group_id" {
  description = "The ID of the created Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}
