resource "yandex_compute_disk" "disk_vm" {
  count    = var.disc_count
  name     = "vm-disk-${count.index}"
  type     = var.hdd-type
  zone     = var.net-zone
  size     = var.disk_size
   
}



resource "yandex_compute_instance" "storage" {
  name = "storage"
  platform_id = var.platform_id_v
  resources {
      cores         = 2
      memory        = 1
      core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic secondary_disk {
      for_each = yandex_compute_disk.disk_vm
      content {
        device_name = "secondary-disk-${secondary_disk.key}"
        disk_id     = "${secondary_disk.value.id}"
      }
    }
  metadata = {
       ssh-keys = local.ssh_key_file
       #"ubuntu:${var.vms_ssh_root_key}"
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}