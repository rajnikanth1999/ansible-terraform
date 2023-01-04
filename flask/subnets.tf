resource "azurerm_subnet" "Subnets" {
  count = length(var.subnet_names)
  name = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name
  address_prefixes = [cidrsubnet(var.Vnet_cidr,8,count.index)]
  
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_virtual_network.vnet
  ]
}