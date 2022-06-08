# Azure subscription ID
variable "subscription_id" {
  type        = string
  description = "Azure account subscription ID"
  default     = "53b8ff38-9c35-473b-9fc9-9562f9da43db"
  sensitive   = true
}

# Azure tenant ID
variable "tenant_id" {
  type        = string
  description = "Azure Service Principal tenant ID"
  default     = "470498c0-975f-4d24-9391-3e4be3c30fd2"
}

# Azure client ID
variable "client_id" {
  type        = string
  description = "Azure Service Principal client ID"
  default     = "7f322fe4-a924-4e18-a61e-dfb47b566efa"
}

# Azure client secret
variable "client_secret" {
  type        = string
  description = "Azure Service Principal client secret"
  sensitive   = true
}

# Azure Location
variable "location" {
  type        = string
  description = "Azure Region where all these resources will be provisioned"
  default     = "East US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
  default     = "pfe-gitops"
}

# Azure AKS Environment Name
variable "environment" {
  type        = string
  description = "This variable defines the Environment"
  default     = "dev"
}

# AKS Input Variables
variable "ssh_public_key" {
  type        = string
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
  sensitive   = true
}