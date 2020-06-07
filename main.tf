#=========================================================#
# Data from vSphere
#=========================================================#
data "vsphere_datacenter" "dc" {
  name = "gallopor"
}

data "vsphere_datastore" "datastore" {
  name          = "ds30"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_host}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network1" {
  name          = "VNet1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network2" {
  name          = "VNet2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vtc_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

#=========================================================#
# Create VMs
#=========================================================#

# Get current time
locals {
   time = "${formatdate("YYYY-MM-DD hh:mm",timeadd(timestamp(),"8h"))}"
}

resource "vsphere_virtual_machine" "vm" {
  count            = var.vtc_count
  name             = "${var.vtc_name_prefix}-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus         = var.vtc_cpu
  memory           = var.vtc_ram
  guest_id         = data.vsphere_virtual_machine.template.guest_id

  annotation       = "${var.vtc_notes}\nCreatedTime: ${local.time}"

  network_interface {
    network_id     = data.vsphere_network.network1.id
    adapter_type   = "e1000"
  }
  
  dynamic "network_interface" {
    for_each = range(var.vtc_port_count)

    content {
        network_id     = data.vsphere_network.network2.id
        adapter_type   = "vmxnet3"
    }
  }

  disk {
    label            = "${var.vtc_name_prefix}-${count.index + 1}-disk"
    size             = var.vtc_disk_size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

#=========================================================#
# Initiate the clone 
#=========================================================#
  clone {
    template_uuid  = data.vsphere_virtual_machine.template.id
  }

  vapp {
    properties = {
      "ipv4mode"   = var.vtc_ip_mode
      "ipaddress"  = cidrhost(var.vtc_cidr, var.vtc_cidr_first_num + count.index)
      "netmask"    = cidrnetmask(var.vtc_cidr)
      "gwaddress"  = var.vtc_gw_address
      "speed"      = var.vtc_port_speed
    }
  }

}

# limit the terraform version
terraform {
  required_version = ">= 0.12.25"
}


