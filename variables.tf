variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  default     = "tofuBLIC_rg"
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
  default     = "Australia East"
}

variable "vm_size" {
  description = "The size of the Virtual Machines."
  type        = string
  default     = "Standard_B2s"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tofuBLIC_rg" {
  name     = var.resource_group_name
  location = var.location
}
