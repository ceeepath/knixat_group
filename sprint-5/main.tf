# Create the web app
resource "azurerm_linux_web_app" "main" {
  name                = "group-2-python-app"
  resource_group_name = data.azurerm_resource_group.my-rg.name
  location            = data.azurerm_service_plan.main.location
  service_plan_id     = data.azurerm_service_plan.main.id
  client_certificate_enabled = false

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
}

# Web app Source Control Configuration
resource "azurerm_app_service_source_control" "main" {
  app_id   = azurerm_linux_web_app.main.id
  repo_url = var.app_service_scm.repo_url
  branch   = var.app_service_scm.branch
}

resource "azurerm_source_control_token" "main" {
  type  = "GitHub"
  token = var.scm_token
}

# Create the development slot
resource "azurerm_linux_web_app_slot" "dev" {
  name           = "development"
  app_service_id = azurerm_linux_web_app.main.id

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
}

resource "azurerm_web_app_active_slot" "dev" {
  slot_id = azurerm_linux_web_app_slot.dev.id
}