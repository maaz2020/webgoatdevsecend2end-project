variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "webgoat-scanner-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
  default     = "Standard_B1s"
}

variable "jenkins_vm_name" {
  description = "Name of the Jenkins VM"
  type        = string
  default     = "jenkins-vm"
}

variable "sonar_vm_name" {
  description = "Name of the SonarQube VM"
  type        = string
  default     = "sonar-vm"
}

variable "webgoat_vm_name" {
  description = "Name of the WebGoat VM"
  type        = string
  default     = "webgoat-vm"
}
