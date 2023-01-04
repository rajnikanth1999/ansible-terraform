resource "azurerm_virtual_network" "vnet" {
  name = var.Vnet_name
  resource_group_name = var.resource_group_name
  address_space = [var.Vnet_cidr]
  location = var.location
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}