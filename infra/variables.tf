variable "preferred_locations" {
  type        = list(string)
  default     = ["East US", "West US", "Central US"]
  description = "Preferred Azure regions in order of priority"
}

variable "resource_group_name" {
  type    = string
  default = "WanchooResourceGroup"
}

variable "acr_name" {
  type    = string
  default = "vikasacr"
}

variable "env_name" {
  type    = string
  default = "vikas-env"
}

variable "app_name" {
  type    = string
  default = "flaskapi-app"
}
