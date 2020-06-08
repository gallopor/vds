data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_host}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "mgmt_net" {
  name          = var.vtc_mgmt_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "test_net" {
  name          = var.vtc_test_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vtc_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}