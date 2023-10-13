#Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_details.name["vnet-name"]
  address_space       = var.vnet_details.address["vnet-address"]
  location            = data.azurerm_resource_group.myrg.location
  resource_group_name = data.azurerm_resource_group.myrg.name
}

#Subnet
resource "azurerm_subnet" "main" {
  name                 = var.vnet_details.name["subnet-name"]
  resource_group_name  = data.azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.vnet_details.address["subnet-address"]
}

# #Public IPs
# resource "azurerm_public_ip" "main" {
#   for_each            = var.vnet_details.nic_datails
#   name                = each.value
#   resource_group_name = data.azurerm_resource_group.myrg.name
#   location            = data.azurerm_resource_group.myrg.location
#   allocation_method   = "Dynamic"
# }

#Network Interfaces
resource "azurerm_network_interface" "main" {
  for_each            = var.vnet_details.nic_datails
  name                = each.value.nic_name
  location            = data.azurerm_resource_group.myrg.location
  resource_group_name = data.azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}