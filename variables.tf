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

variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub token for accessing private repositories"
  default     = "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"
}
variable "GITHUB_USERNAME" {
  type        = string
  description = "GitHub username for accessing private repositories"
  default     = "carlos@blic.llc"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "cmmc"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

