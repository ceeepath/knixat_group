#VMs Details
locals {
  description = "Details for Virtual Machines"
  username    = "adminuser"
  password    = "P@$$w0rd1234!"
  ssh-key     = file("azurepubkey.pem")
  vm-size     = "Standard_B1s"
}