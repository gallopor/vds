#=========================================================#
# Output
#=========================================================#
# output "vtc_ip_addr" {
#   value = vsphere_virtual_machine.vm[*].guest_ip_addresses
# }

output "vtc_ip_addr" {
  value = {
    for instance in vsphere_virtual_machine.vm:
      instance.name => instance.guest_ip_addresses
  }
}