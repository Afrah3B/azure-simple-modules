resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.instance_count
  name                  = "${var.virtual_machine_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids[count.index]]
  size                  = var.vm_size

  os_disk {
    name                 = "${var.os_disk_name}-${count.index}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  computer_name                    = "${var.virtual_machine_name}-${count.index + 1}"
  admin_username                   = var.vm_admin_username
  admin_password                   = var.vm_admin_password
  disable_password_authentication = var.vm_disable_password_authentication

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  tags = var.tags
}