variable "app_service_scm" {
  description = "Manages an App Service Web App or Function App Source Control Configuration."
  type = map(string)
  default = {
    "repo_url" = "https://github.com/francdomain/users-webapp.git"
    "branch"  =  "main"
  }
}

variable "scm_token" {
  description = "Github Token for CI webhook."
  type = string
}