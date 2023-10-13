#Networking details variables
variable "vnet_details" {
  type = object({
    name        = map(string)
    address     = map(list(string))
    nic_datails = map(map(string))
  })
  description = "This contains details of the virtual network to be created"
  default = {
    name = {
      "vnet-name"   = "vnet-eastus2-01"
      "subnet-name" = "subnet-eastus2-01"
    }
    address = {
      "vnet-address"   = ["192.168.0.0/16"]
      "subnet-address" = ["192.168.0.0/24"]
    }
    nic_datails = {
      "web-vm-01" = {nic_name = "nic-eastus2-01", zone = "3", user_data = "./scripts/apache.sh"}
      "web-vm-02" = {nic_name = "nic-eastus2-02", zone = "2", user_data = "./scripts/apache.sh"}
      "app-vm-01" = {nic_name = "nic-eastus2-03", zone = "3", user_data = "./scripts/empty_script.sh"}
      "app-vm-02" = {nic_name = "nic-eastus2-04", zone = "2", user_data = "./scripts/empty_script.sh"}
      "db-vm-01"  = {nic_name = "nic-eastus2-05", zone = "3", user_data = "./scripts/empty_script.sh"}
      "db-vm-02"  = {nic_name = "nic-eastus2-06", zone = "2", user_data = "./scripts/empty_script.sh"}
    }
  }
}

