#=========================================================#
# VMware vCenter Connection #
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
# variable "vsphere_host" {
#   type        = string
#   description = "VMWare vSphere datacenter"
# }

# variable "vm_resource_pool" {
#   type        = string
#   description = "The VM resource pool"
# }

