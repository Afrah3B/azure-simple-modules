resource "azurerm_application_gateway" "appgtw" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_name
    subnet_id = var.gateway_subnet_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port_number
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration
    public_ip_address_id = var.appgw_public_ip_id
  }

  backend_address_pool {
    name = var.backend_address_pool_name
    ip_addresses = var.backend_ip_addresses
  }

  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = var.frontend_port_number
    protocol              = var.protocol
    request_timeout       = 60
    probe_name            = var.probe_name
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.protocol
  }

  request_routing_rule {
    name                       = var.routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings_name
  }

  probe {
    name                = var.probe_name
    protocol            = var.protocol
    host                = var.probe_host
    path                = var.probe_path
    interval            = 30
    timeout             = 20
    unhealthy_threshold = 3
  }
}
