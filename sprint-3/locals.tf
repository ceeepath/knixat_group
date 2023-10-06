locals {
  web-nsg-rules = {
    http = {
      name                       = "AllowAllHttpInboundToWeb"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "10.0.0.0/24"
    }

    https = {
      name                       = "AllowAllHttpsInboundToWeb"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "10.0.0.0/24"
    }
  }

  app-nsg-rules = {
    allow_web = {
      name                       = "AllowInboundToAppServers"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8080"
      source_address_prefix      = "10.0.0.0/24"
      destination_address_prefix = "10.0.1.0/24"
    }

    allowdb = {
      name                       = "AllowTrafficFromDatabase"
      priority                   = 140
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.0.2.0/24"
      destination_address_prefix = "10.0.1.0/24"
    }

    denyallotherinbound = {
      name                       = "DenyAllOtherInboundTraffic"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "10.0.1.0/24"
    }
  }

  db-nsg-rules = {
    allow_app = {
      name                       = "AllowInboundToDBServers"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3306"
      source_address_prefix      = "10.0.1.0/24"
      destination_address_prefix = "10.0.2.0/24"
    }

    denyallotherinbound = {
      name                       = "DenyAllOtherInboundTraffic"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "10.0.2.0/24"
    }
  }
}

