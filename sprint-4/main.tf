# Linux VMs
resource "azurerm_linux_virtual_machine" "main" {
  for_each              = var.vnet_details.nic_datails
  name                  = each.key
  resource_group_name   = data.azurerm_resource_group.myrg.name
  location              = data.azurerm_resource_group.myrg.location
  size                  = local.vm-size
  admin_username        = local.username
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  user_data             = filebase64(each.value.user_data)
  zone                  = each.value.zone

  admin_ssh_key {
    username   = local.username
    public_key = local.ssh-key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


