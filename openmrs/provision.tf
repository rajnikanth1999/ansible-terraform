resource "null_resource" "files" {
  triggers = {
    trigger = var.trigger
  }
  provisioner "file" {
    source = "./openmrs.service"
    destination = "/home/openmrs/openmrs.service"
    connection {
    host = azurerm_public_ip.publicip.ip_address
    password = var.web_pass
    user = var.web_user
    }
  }
  provisioner "file" {
    source = "./ansible.yaml"
    destination = "/home/openmrs/ansible.yaml"
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
        "sudo apt update",
        "sudo apt-add-repository ppa:ansible/ansible -y",
        "sudo apt install ansible -y",
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