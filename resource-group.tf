# Terraform Resource to Create Azure Resource Group with Input Variables defined in variables.tf
resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
}

resource "azurerm_management_lock" "rg-lock" {
  name       = "rg-lock"
  lock_level = "CanNotDelete"
  scope      = azurerm_resource_group.aks_rg.id
  notes      = "Locked for security compliance"
}