#=========================================================#
# VMware vCenter connection #
#=========================================================#
variable "vsphere_user" {
  type        = string
  description = "VMware vCenter User Name"
}

variable "vsphere_password" {
  type        = string
  description = "VMware vSphere Password"
}

variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter Server FQDN/IP"
}


#=========================================================#
# VMware vSphere Properties #
#=========================================================#
variable "vsphere_host" {
  type        = string
  description = "VMWare vSphere datacenter"
}

# variable "vm_resource_pool" {
#   type        = string
#   description = "The VM resource pool"
# }

#=========================================================#
# vTC Properties #
#=========================================================#
variable "vtc_count" {
  type        = number
  default     = 1
  description = "Count of the vTC"
}

variable "vtc_name_prefix" {
  type        = string
  default     = "vTC"
  description = "The name prefix of the vTC"
}

variable "vtc_cpu" {
  type        = number
  default     = 1
  description = "Count of vCPU for the vTC"
}

variable "vtc_ram" {
  type        = number
  default     = 1024
  description = "Amount of RAM for the vTC"
}

variable "vtc_disk_size" {
  type        = number
  default     = 2
  description = "Amount of Disk for the vTC"
}

variable "vtc_port_count" {
  type        = number
  default     = 2
  description = "Count of network interfaces for the vTC"
}

variable "vtc_template_name" {
  type        = string
  description = "The template to create the vTC"
}

variable "vtc_notes" {
  type        = string
  description = "The notes of the vTC"
}

variable "vtc_ip_mode" {
  type        = string
  default     = "dhcp"
  description = "The IP mode of the VM"
}

variable "vtc_cidr" {
  type        = string
  description = "The IP address of the VM"
}

variable "vtc_cidr_first_num" {
  type        = number
}

variable "vtc_gw_address" {
  type        = string
}

variable "vtc_port_speed" {
  type        = string
  default     = "1G"
  description = "The port speed of the VM"
}
