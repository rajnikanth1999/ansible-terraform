resource "azurerm_public_ip" "publicip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.ip_allocation_method
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}
resource "azurerm_network_interface" "webnic" {
  location            = var.location
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.publicip.id
    subnet_id                     = azurerm_subnet.Subnets[1].id
    primary                       = true
    name                          = var.public_ip_name
    private_ip_address_allocation = var.private_ip_allocation
  }
}