resource "azurerm_public_ip" "vm-pub-ip" {
  name                = var.load_balancer_detail.public_ip_name
  location            = data.azurerm_resource_group.myrg.location
  resource_group_name = data.azurerm_resource_group.myrg.name
  allocation_method   = "Static"
  zones               = ["2", "3"]
  sku                 = "Standard"
}

# Load balancer configuration
resource "azurerm_lb" "vm-lb" {
  name                = var.load_balancer_detail.name
  location            = data.azurerm_resource_group.myrg.location
  resource_group_name = data.azurerm_resource_group.myrg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.load_balancer_detail.frontend_ip_config_name
    public_ip_address_id = azurerm_public_ip.vm-pub-ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-backend-pool" {
  loadbalancer_id = azurerm_lb.vm-lb.id
  name            = var.load_balancer_detail.lb_address_pool_name
}

# Load balancer rule
resource "azurerm_lb_rule" "vm-lb-rule" {
  loadbalancer_id                = azurerm_lb.vm-lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.load_balancer_detail.frontend_ip_config_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb-backend-pool.id]
}

# Load balancer backend association
resource "azurerm_network_interface_backend_address_pool_association" "main" {
  for_each                = var.load_balancer_association
  network_interface_id    = azurerm_network_interface.main[each.key].id
  ip_configuration_name   = each.value
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-backend-pool.id
}