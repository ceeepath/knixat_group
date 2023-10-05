variable "subnet" {
  type = map ()
  default = {
    "web-subnet" = "10.0.0.0/24"
    "app-subnet" = "10.0.1.0/24"
    "db-subnet"  = "10.0.2.0/24"
  }
}