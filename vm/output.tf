output "vm_ids" {
  description = "IDs of the virtual machines"
  value       = [for vm in azurerm_linux_virtual_machine.vm : vm.id]
}

output "vm_private_ips" {
  description = "Private IP addresses of the virtual machines"
  value       = [for vm in azurerm_linux_virtual_machine.vm : vm.private_ip_address]
}

output "vm_public_ips" {
  description = "Public IP addresses of the virtual machines"
  value       = [for vm in azurerm_linux_virtual_machine.vm : vm.public_ip_address]
}

output "nic_ids" {
  description = "The IDs of the created Network Interfaces"
  value       = [for nic in azurerm_network_interface.nic : nic.id]
}

output "nic_private_ips" {
  description = "The private IPs of the network interfaces"
  value = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
}