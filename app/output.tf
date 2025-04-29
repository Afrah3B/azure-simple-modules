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

output "load_balancer_id" {
  description = "ID of the Azure Load Balancer"
  value       = azurerm_lb.loadbalancer.id
}

output "load_balancer_public_ip" {
  description = "Public IP address of the Load Balancer"
  value       = var.frontend_public_ip_address_id
}

output "application_gateway_id" {
  description = "ID of the Application Gateway"
  value       = azurerm_application_gateway.appgtw.id
}

output "application_gateway_public_ip" {
  description = "Public IP address of the Application Gateway"
  value       = var.appgw_public_ip_id
}
