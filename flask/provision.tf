resource "null_resource" "files" {
  triggers = {
    trigger = var.trigger
  }
  provisioner "file" {
    source = "./flask.service"
    destination = "/home/flask/flask.service"
    connection {
    host = azurerm_public_ip.publicip.ip_address
    password = var.web_pass
    user = var.web_user
    }
  }
  provisioner "file" {
    source = "./ansible.yaml"
    destination = "/home/flask/ansible.yaml"
    connection {
    host = azurerm_public_ip.publicip.ip_address
    password = var.web_pass
    user = var.web_user
    }
  }
  depends_on = [
    azurerm_virtual_machine.app
  ]
}
resource "null_resource" "ansible" {
  triggers = {
    trigger = var.trigger
  }
  provisioner "remote-exec" {
    inline = [
        "ansible-playbook ansible.yaml"
    ]
    connection {
    host = azurerm_public_ip.publicip.ip_address
    password = var.web_pass
    user = var.web_user
    }
  }
  depends_on = [
    null_resource.files
  ]
}