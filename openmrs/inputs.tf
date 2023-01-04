variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "openmrs"
}
variable "location" {
  type        = string
  description = "Location for all resources"
  default     = "central india"
}
variable "Vnet_name" {
  type        = string
  description = "Virtual Network Name"
  default     = "openmrs"
}
variable "Vnet_cidr" {
  type        = string
  description = "Virtual Network cidr range"
  default     = "192.168.0.0/16"
}
variable "subnet_names" {
  type        = list(string)
  description = "Subnets Names"
  default     = ["app", "web", "db"]
}
variable "nsg_name" {
  type        = string
  description = "For Network security group name"
  default     = "openmrs-NSG"
}
variable "sql_server_name" {
  type        = string
  description = "SQL server name"
  default     = "ntierserver"
}
variable "username" {
  type        = string
  description = "Username for SQL server login"
  default     = "Terraform"
}
variable "password" {
  type        = string
  description = "Password for SQL server"
  sensitive   = true
  default     = "N@ni@!999"
}
variable "database_name" {
  type        = string
  description = "Database Name"
  default     = "database"
}
variable "firewall_rule_name" {
  type        = string
  description = "For Server Firewall Rule"
  default     = "Firewall-Ntier"
}
variable "vm_name" {
  type        = string
  description = "For virtual machine name"
  default     = "app"
}
variable "nic_name" {
  type        = string
  description = "For Nic name"
  default     = "openmrs_Nic"
}
variable "trigger" {
  type        = string
  description = "trigger"
  default     = "0.1"
}
variable "web_user" {
  type        = string
  description = "For web server user name"
  default     = "openmrs"
}
variable "web_pass" {
  type        = string
  description = "For web server password "
  default     = "Password@1234"
}
variable "ip_allocation_method" {
  type        = string
  description = "For static or dynamic public ip"
  default     = "Static"
}
variable "public_ip_name" {
  type        = string
  description = "For public name"
  default     = "web"
}
variable "private_ip_allocation" {
  type        = string
  description = "For static or dynamic ip"
  default     = "Dynamic"
}
variable "sql_server_version" {
  type        = string
  description = "Version for sql server"
  default     = "12.0"
}
variable "sql_server_public_access" {
  type        = bool
  description = "For sql server public access 'true' or 'false'"
  default     = true
}
variable "sql_firewall_rule_start_ip" {
  type        = string
  description = "(optional) describe your variable"
  default     = "0.0.0.0"
}
variable "sql_firewall_rule_end_ip" {
  type        = string
  description = "(optional) describe your variable"
  default     = "255.255.255.255"
}
variable "vm_size" {
  type        = string
  description = "Size of vm"
  default     = "Standard_D4s_v3"
}
variable "delete_disk" {
  type        = bool
  description = "Delete disk after the vm is deleted"
  default     = true
}
variable "publisher" {
  type        = string
  description = "Publisher for vm"
  default     = "Canonical"
}
variable "offer" {
  type        = string
  description = "Offer from the publisher"
  default  = "0001-com-ubuntu-server-focal"
}
variable "sku" {
  type        = string
  description = "Sku for the vm"
  default     = "20_04-LTS-gen2"
}
variable "vm_version" {
  type        = string
  description = "version for vm"
  default     = "latest"
}
variable "disk_name" {
  type        = string
  description = "For VM Disk name"
  default     = "disk-ntier"
}
variable "caching" {
  type        = string
  description = "caching for the disk"
  default     = "ReadWrite"
}
variable "createOption" {
  type        = string
  description = "create option for the disk"
  default     = "FromImage"
}
variable "managed_disk_type" {
  type        = string
  description = "Disk size or type"
  default     = "Standard_LRS"
}
variable "disable_password_authentication" {
  type        = bool
  description = "Password authentication 'true' or 'false'"
  default     = false
}
variable "security_rules" {
  type = list(object(
     {
      name                       = string,
      priority                   = string
      direction                  = string,
      access                     = string,
      protocol                   = string,
      source_port_range          = string,
      source_address_prefix      = string,
      destination_port_range     = string,
      destination_address_prefix = string
  }
  ))
  description = "for security group rules"
  default = [
    {
    name                       = "HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "5000"
    destination_address_prefix = "*"
    },
    {
      name                       = "SSH"
      priority                   = 320
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}