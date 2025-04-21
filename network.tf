resource "azurerm_virtual_network" "tofuBLIC_VNet" {
  name                = "tofuBLIC-vnet"
  resource_group_name = azurerm_resource_group.tofuBLIC_rg.name
  location            = azurerm_resource_group.tofuBLIC_rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "tofuBLIC_Web_Subnet" {
  name                 = "tofuBLIC-web-subnet"
  resource_group_name  = azurerm_resource_group.tofuBLIC_rg.name
  virtual_network_name = azurerm_virtual_network.tofuBLIC_VNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "tofuBLIC_App_Subnet" {
  name                 = "tofuBLIC-app-subnet"
  resource_group_name  = azurerm_resource_group.tofuBLIC_rg.name
  virtual_network_name = azurerm_virtual_network.tofuBLIC_VNet.name
  address_prefixes     = ["10.0.2.0/24"]
}
