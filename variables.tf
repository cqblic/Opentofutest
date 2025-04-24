variable "prefix" {
  type    = string
  default = "wolf"
}
variable "location" {
  type    = string
  default = "westus2"
}
variable "rg_name" {
  type    = string
  default = "wolf-rg"
}
variable "vm_name" {
  type    = string
  default = "wolfApp"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "cmmc"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

