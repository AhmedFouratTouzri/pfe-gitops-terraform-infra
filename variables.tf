# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "East US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "This variable defines the Resource Group"
  default = "pfe-gitops"
}

# Azure AKS Environment Name
variable "environment" {
  type = string  
  description = "This variable defines the Environment"  
  default = "dev"
}

# AKS Input Variables
variable "ssh_public_key" {
  default = "~/.ssh/pfe-gitops-terraform/id_rsa.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}