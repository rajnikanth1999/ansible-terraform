resource "azurerm_virtual_machine" "app" {
  resource_group_name = var.resource_group_name
  location = var.location
  name = var.vm_name
  network_interface_ids = [azurerm_network_interface.webnic.id]
  vm_size = var.vm_size
  delete_os_disk_on_termination = var.delete_disk
  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vm_version
  }
  storage_os_disk {
    name              = var.disk_name
    caching           = var.caching
    create_option     = var.createOption
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = var.web_user
    admin_username = var.web_user
    admin_password = var.web_pass
  }
  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }
  depends_on = [
    azurerm_network_security_group.webnsg
  ]
}