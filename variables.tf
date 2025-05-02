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

variable "dns_zone" {
  type        = string
  description = "DNS zone name for the VM."
  default     = "sa-cmmc.com"
}

variable "dns_resource_group_name" {
  type        = string
  description = "Resource group name for the DNS zone."
  default     = "wolf-rg"
}

variable "private_key" {
  type        = string
  description = "Private key for SSH access to the VM.  Referenced from TF_VAR_PRIVATE_KEY environment variable."
}

variable "fullchain" {
  type        = string
  description = "Full chain certificate for the VM.  Referenced from TF_VAR_FULLCHAIN environment variable."
}

variable "MONGODB_URL" {
  type        = string
  description = "MongoDB URL for the VM.  Referenced from TF_VAR_MONGODB_URL environment variable."
}

variable "AZURE_AUD" {
  type        = string
  description = "Azure AD application ID for the VM.  Referenced from TF_VAR_AZURE_AUD environment variable."
}

variable "AZURE_ISS" {
  type        = string
  description = "Azure AD issuer URL for the VM.  Referenced from TF_VAR_AZURE_ISS environment variable."
}
variable "AZURE_TENANT_ID" {
  type        = string
  description = "Azure AD tenant ID for the VM.  Referenced from TF_VAR_AZURE_TENANT_ID environment variable."
}
variable "AZURE_TENANT_NAME" {
  type        = string
  description = "Azure AD tenant name for the VM.  Referenced from TF_VAR_AZURE_TENANT_NAME environment variable."
}
variable "JWT_SECRET" {
  type        = string
  description = "JWT secret for the VM.  Referenced from TF_VAR_JWT_SECRET environment variable."
}
variable "USE_SECURE_COOKIES" {
  type        = string
  description = "Use secure cookies for the VM.  Referenced from TF_VAR_USE_SECURE_COOKIES environment variable."
}

variable "ENVIRONMENT" {
  type        = string
  description = "Environment for the VM.  Referenced from TF_VAR_ENVIRONMENT environment variable."
  default     = "dev"
}


