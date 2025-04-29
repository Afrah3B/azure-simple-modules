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
