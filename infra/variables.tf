variable "preferred_locations" {
  type        = list(string)
  default     = ["East US", "West US", "Central US"]
  description = "Preferred Azure regions in order of priority"
}

variable "resource_group_name" {
  type    = string
  default = "WanchooResourceGroup1"
}

variable "acr_name" {
  type    = string
  default = "vikasacr1"
}

variable "env_name" {
  type    = string
  default = "vikas-env1"
}

variable "app_name" {
  type    = string
  default = "flaskapi-app1"
}
