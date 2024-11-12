# variables.tf
variable "resource_group_name" {
  description = "Resource group for AKS"
  type        = string
  default     = "rg-aks-gitops"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
