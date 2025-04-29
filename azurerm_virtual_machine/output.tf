output "tls_private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "public_ips" {
  value = [
    for vm in azurerm_linux_virtual_machine.vm : vm.public_ip_address
  ]
}
