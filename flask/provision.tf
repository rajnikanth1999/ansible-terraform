# resource "null_resource" "files" {
#   triggers = {
#     trigger = var.trigger
#   }
#   provisioner "file" {
#     source = "./springpetclinic.service"
#     destination = "/home/web/springpetclinic.service"
#     connection {
#     host = azurerm_public_ip.publicip.ip_address
#     password = var.web_pass
#     user = var.web_user
#     }
#   }
#   provisioner "file" {
#     source = "./ansible.yaml"
#     destination = "/home/web/ansible.yaml"
#     connection {
#     host = azurerm_public_ip.publicip.ip_address
#     password = var.web_pass
#     user = var.web_user
#     }
#   }
#   depends_on = [
#     azurerm_virtual_machine.app
#   ]
# }
# resource "null_resource" "ansible" {
#   triggers = {
#     trigger = var.trigger
#   }
#   provisioner "remote-exec" {
#     inline = [
#         "sudo apt update",
#         "sudo apt-add-repository ppa:ansible/ansible -y",
#         "sudo apt install ansible -y",
#         # "wget --user=praveendba31@gmail.com --password='N@ni@!999'  https://jenkinsjfrogspring.jfrog.io/artifactory/frog-libs-release-local/org/springframework/samples/spring-petclinic/2.7.3/spring-petclinic-2.7.3.jar"
#         "ansible-playbook ansible.yaml"
#     ]
#     connection {
#     host = azurerm_public_ip.publicip.ip_address
#     password = var.web_pass
#     user = var.web_user
#     }
#   }
#   depends_on = [
#     null_resource.files
#   ]
# }