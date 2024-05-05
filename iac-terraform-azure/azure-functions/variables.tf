variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure storage account"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the Azure app service plan"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Azure function app"
  type        = string
}

variable "function_name" {
  description = "Name of the Azure function"
  type        = string
}
