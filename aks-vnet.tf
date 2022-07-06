# Create Virtual Network
resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-network"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = ["10.0.0.0/8"]
}

# Create a Subnet for AKS
resource "azurerm_subnet" "aks-default" {
  name                 = "aks-default-subnet"
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  address_prefixes     = ["10.240.0.0/16"]

}

data "azurerm_network_security_group" "aks-nsg" {
  name                = "aks-agentpool-10305198-nsg"
  resource_group_name = "pfe-gitops-dev-nrg"
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-association" {
  network_security_group_id = data.azurerm_network_security_group.aks-nsg.id
  subnet_id                 = azurerm_subnet.aks-default.id
}