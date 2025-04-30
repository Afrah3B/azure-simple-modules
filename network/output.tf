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
output "public_ip_ids" {
  description = "List of public IP resource IDs"
  value       = [for ip in azurerm_public_ip.public_ip : ip.id]
}

output "public_ip_addresses" {
  description = "List of public IP addresses"
  value       = [for ip in azurerm_public_ip.public_ip : ip.ip_address]
}
