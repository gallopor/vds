# limit the terraform version
terraform {
  required_version = ">= 0.12"
}

module "vtc" {
  source             = "./modules/vtc"

  vsphere_datacenter = "gallopor"
  vsphere_host       = "192.168.1.30"
  vsphere_datastore  = "ds30"
  vtc_mgmt_network   = "VNet1"
  vtc_test_network   = "VNet2"

  vtc_count          = 2
  vtc_template_name  = "vTC_509"

  vtc_cpu            = 2
  vtc_ram            = 2048
  vtc_disk_size      = 2
  vtc_port_count     = 4
  vtc_port_speed     = "1G"
  vtc_ip_mode        = "static"
  vtc_cidr_first_num = 51
  vtc_cidr           = "192.168.1.0/24"
  vtc_gw_address     = "192.168.1.1"

  vtc_notes          = "vTC 5.09"
}

# module "vtc_10" {
#   source             = "./modules/vtc"

#   vsphere_datacenter = "gallopor"
#   vsphere_host       = "192.168.1.10"
#   vsphere_datastore  = "ds10"
#   vtc_mgmt_network   = "VMNet1"
#   vtc_test_network   = "VMNet2"

#   vtc_count          = 2
#   vtc_template_name  = "vTC_509_10"

#   vtc_cpu            = 2
#   vtc_ram            = 2048
#   vtc_disk_size      = 2
#   vtc_port_count     = 4
#   vtc_port_speed     = "1G"
#   vtc_ip_mode        = "static"
#   vtc_cidr_first_num = 61
#   vtc_cidr           = "192.168.1.0/24"
#   vtc_gw_address     = "192.168.1.1"

#   vtc_notes          = "vTC 5.09"
# }

