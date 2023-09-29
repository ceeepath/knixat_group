# Create a policy to block the provisioning of virtual machines with public IP

resource "azurerm_policy_definition" "vmpolicy" {
  name         = "Disallow creation of VMs with Public IP"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Disallow creation of VMs with Public IP"

  metadata = <<METADATA
    {
    "category": "Custom"
    }

METADATA


  policy_rule = <<POLICY_RULE
 {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Network/networkInterfaces"
        },
        {
          "field": "Microsoft.Network/networkInterfaces/ipconfigurations[*].publicIpAddress.id",
          "exists": true
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE
}


# Assign the policy to block the provisioning of virtual machines with public IP

resource "azurerm_resource_group_policy_assignment" "vmpolass" {
  name                 = "Disallow creation of VMs with Public IP"
  resource_group_id    = data.azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.vmpolicy.id

  non_compliance_message { content = "Virtual Machine can not be created using Public IP in this Resource Group" }
}


# Create a policy to block the provisioning of storage accounts with public access

resource "azurerm_policy_definition" "sapolicy" {
  name         = "Disallow creation of Storage Account with Public Access"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Disallow creation of Storage Account with Public Access"

  metadata = <<METADATA
    {
    "category": "Custom"
    }

METADATA


  policy_rule = <<POLICY_RULE
 {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Storage/storageAccounts"
        },
        {
          "field": "Microsoft.Storage/storageAccounts/publicNetworkAccess",
          "notEquals": "Disabled"
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE
}

# Assign the policy to block the provisioning of storage account with public access

resource "azurerm_resource_group_policy_assignment" "sapolass" {
  name                 = "Disallow creation of Storage Acct with Public Access"
  resource_group_id    = data.azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.sapolicy.id

  non_compliance_message { content = "Storage Account can not be created using Public Access in this Resource Group" }
}

# Exemptions for both policies

resource "azurerm_resource_group_policy_exemption" "vmpolexem" {
  name                 = "Exemption to allow creation of VMs"
  resource_group_id    = data.azurerm_resource_group.rg.id
  policy_assignment_id = azurerm_resource_group_policy_assignment.vmpolass.id
  exemption_category   = "Mitigated"
}

resource "azurerm_resource_group_policy_exemption" "sapolexem" {
  name                 = "Exemption to allow creation of Storage Acct"
  resource_group_id    = data.azurerm_resource_group.rg.id
  policy_assignment_id = azurerm_resource_group_policy_assignment.sapolass.id
  exemption_category   = "Mitigated"
}


# Resources to test policy assignment and exemption

# Creation of VM with Public Ip

resource "azurerm_public_ip" "pip" {
  name                = "policyTestPublicIp1"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "tvn" {
  name                = "policyTestNetwork"
  address_space       = ["192.168.0.0/24"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sn" {
  name                 = "policyTestSubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.tvn.name
  address_prefixes     = ["192.168.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "policyTest-nic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "policyTestIP"
    subnet_id                     = azurerm_subnet.sn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "tvm" {
  name                = "policyTestVM"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  disable_password_authentication = "false"
  admin_password      = "policyTestpass2"
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}


# Creation of Storage Account with Public Access

resource "azurerm_storage_account" "stacct" {
  name                     = "grouptwostacct"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = true
}


