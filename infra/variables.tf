variable "resource_group_name" {
  type        = string
  default     = "WanchooResourceGroup1"
}

variable "location" {
  type        = string
  default     = "East US"
}

variable "acr_name" {
  type        = string
  default     = "vikasacr1"
}

variable "env_name" {
  type        = string
  default     = "vikas-env1"
}

variable "app_name" {
  type        = string
  default     = "flaskapi-app1"
}
