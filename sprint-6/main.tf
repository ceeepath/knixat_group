resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Storage account
resource "azurerm_storage_account" "sa" {
  name                     = "${var.function_app_details["sa_name"]}${random_integer.ri.result}"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = var.function_app_details["account_tier"]
  account_replication_type = var.function_app_details["account_rep_type"]
}

# Service plan
resource "azurerm_service_plan" "main" {
  name                = var.function_app_details["plan_name"]
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  os_type             = var.function_app_details["os_type"]
  sku_name            = var.function_app_details["sku_name"]
}

# Function app
resource "azurerm_linux_function_app" "functionapp" {
  name                = var.function_app_details["app_name"]
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.main.id

  site_config {
    application_stack {
      python_version = var.function_app_details["python_version"]
    }
  }
  app_settings = {
    "FUNCTIONS_EXTENSION_VERSION" = var.function_app_details["extension_version"]
    "FUNCTIONS_WORKER_RUNTIME"    = var.function_app_details["worker_runtime"]
  }
}

# Logic app
resource "azurerm_logic_app_workflow" "http" {
  name                = var.logic_app_http_name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
}