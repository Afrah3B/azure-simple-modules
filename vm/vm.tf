resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.instance_count
  name                  = "${var.virtual_machine_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
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


resource "azurerm_network_interface" "nic" {
  count               = var.instance_count
  name                = "${var.nic_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.nic_subnet_ids[count.index]
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_ids[count.index]
  }

  tags = var.tags
}


resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  count                     = var.instance_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = var.network_security_group_id
}