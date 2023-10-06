variable "subnet" {
  type = map(string)
  default = {
    "web-subnet" = "10.0.0.0/24"
    "app-subnet" = "10.0.1.0/24"
    "db-subnet"  = "10.0.2.0/24"
  }
}

variable "nsg" {
  description = "Details of Network Security Groups"
  type        = map(string)
  default = {
    "web-subnet" = "web-nsg"
    "app-subnet" = "app-nsg"
    "db-subnet"  = "db-nsg"
  }
}

variable "nsg-assoc" {
  description = "Security Groups Association Names"
  type        = map(string)
  default = {
    "web-subnet" = "web-nsg-association"
    "app-subnet" = "app-nsg-association"
    "db-subnet"  = "db-nsg-association"
  }
}