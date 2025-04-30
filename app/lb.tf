resource "azurerm_lb" "loadbalancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku ="Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.frontend_public_ip_address_id
  }
  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                             = var.lb_backend_pool_name
  loadbalancer_id                  = azurerm_lb.loadbalancer.id
}

resource "azurerm_lb_backend_address_pool_address" "backend_pool_address1" {
  for_each = { for idx, ip in var.backend_ip_addresses : idx => ip }
  name                                = "${var.lb_backend_address_name}-${each.key}"
  backend_address_pool_id             = azurerm_lb_backend_address_pool.backend_pool.id
  ip_address = each.value
  virtual_network_id = var.virtual_network_id
}

resource "azurerm_lb_outbound_rule" "backend_http_settings" {
  name                    = var.lb_outbound_rule_name
  loadbalancer_id         = azurerm_lb.loadbalancer.id
  protocol                = var.protocol
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id

  frontend_ip_configuration {
    name = var.frontend_ip_configuration_name
  }
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  protocol                       = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  disable_outbound_snat          = true
}

resource "azurerm_lb_probe" "health_probe" {
  name                              = "health-probe"
  loadbalancer_id                   = azurerm_lb.loadbalancer.id
  port                              = var.backend_port
  protocol                          = var.protocol
  request_path                      = var.lb_probe_path
  interval_in_seconds               = 15
  number_of_probes                  = 3
}


