variable "resource_group_name" {
  description = "The resource group name"
  type        = string
  default     = "cohort4_group2"
}

variable "function_app_details" {
  description = "Information of the function app configuration"
  type        = map(string)
  default = {
    "app_name"          = "group2-function-app"
    "plan_name"         = "service-plan"
    "os_type"           = "Linux"
    "sku_name"          = "Y1"
    "python_version"    = "3.11"
    "sa_name"           = "functionappsa"
    "account_tier"      = "Standard"
    "account_rep_type"  = "LRS"
    "app_type"          = "web"
    "extension_version" = "~4"
    "worker_runtime"    = "python"
  }
}



variable "logic_app_http_name" {
  type = string
  description = "The ID of the logic app"
  default = "logic-app-http"
}