variable "each_vm" {
  type = map(object({  
    #vm_name=string, 
    cpu=number, 
    ram=number, 
    disk_volume=number }))
  default = {
    main = {
      cpu     = 2
      ram     = 2
      disk_volume = 10
    }
  replica = {
      cpu     = 2
      ram     = 1
      disk_volume = 5
    }
  }
}

# variable "each_vm" {
#   type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
# }


resource "yandex_compute_instance" "db" {
for_each = var.each_vm
name = "db-${each.key}"
    platform_id = var.platform_id_v

    resources {
       cores         = each.value.cpu
       memory        = each.value.ram
       core_fraction = var.vms_resources.web.core_fraction 
  }
    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
    }
  }
    metadata = {
        sensitive = true       
        ssh-keys = local.ssh_key_file
  }
    network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}

