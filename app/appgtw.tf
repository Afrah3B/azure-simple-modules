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
    name = var.gateway_frontend_port_name
    port = var.gateway_frontend_port_number
  }

  frontend_ip_configuration {
    name                 = var.gateway_frontend_ip_configuration
    public_ip_address_id = var.appgw_public_ip_id
  }

  backend_address_pool {
    name = var.gateway_backend_address_pool_name
    ip_addresses = var.gateway_backend_ip_addresses
  }

  backend_http_settings {
    name                  = var.gateway_backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = var.gateway_frontend_port_number
    protocol              = var.gateway_protocol
    request_timeout       = 60
    probe_name            = var.gateway_probe_name
  }

  http_listener {
    name                           = var.gateway_http_listener_name
    frontend_ip_configuration_name = var.gateway_frontend_ip_configuration
    frontend_port_name             = var.gateway_frontend_port_name
    protocol                       = var.gateway_protocol
  }

  request_routing_rule {
    name                       = var.gateway_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = var.gateway_http_listener_name
    backend_address_pool_name  = var.gateway_backend_address_pool_name
    backend_http_settings_name = var.gateway_backend_http_settings_name
  }

  probe {
    name                = var.gateway_probe_name
    protocol            = var.gateway_protocol
    host                = var.gateway_probe_host
    path                = var.gateway_probe_path
    interval            = 30
    timeout             = 20
    unhealthy_threshold = 3
  }
  tags = var.tags
}
