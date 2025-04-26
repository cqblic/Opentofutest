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
  description = "GitHub token for accessing private repositories.  Referenced from TF_VAR_GITHUB_TOKEN environment variable."
  default    = ""
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

variable "MONGODB_URL" {
  type  = string
  description = "MONGO URL to connect to mongdo db atlas service"
  default = ""
}

variable "AZURE_TENANT_NAME" {
  type  = string
  description = "Azure tenant name for login accounts" 
  default = "sacmmc"
}

variable "AZURE_TENANT_ID" {
  type  = string
  description = "Azure tenant name for login accounts" 
  default = "3b5b9af2-5ead-459f-afe8-deb4a07d7941"
}

variable "AZURE_ISS" {
  type  = string
  description = "Azure B2C URL" 
  default = "https://sacmmc.b2clogin.com/3b5b9af2-5ead-459f-afe8-deb4a07d7941/v2.0/"
}

variable "ENVIRONMENT" {
  type  = string
  description = "environment" 
  default = "dev"
}

