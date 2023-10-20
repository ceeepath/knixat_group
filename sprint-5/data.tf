# Resource group details
data "azurerm_resource_group" "main" {
  name = "knixat-student-demo"
}

data "azurerm_resource_group" "my-rg" {
  name = "cohort4_group2"
}

# Service plan details
data "azurerm_service_plan" "main" {
  name                = "knixat-demo"
  resource_group_name = data.azurerm_resource_group.main.name
}