resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.dev_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "demo" {
  name           = var.demo_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_default_cidr
}




data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_os_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
    #cores         = var.vm_web_cores
    # memory       = var.vm_web_memory
    #core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.meta-ssh
  #= {
   # serial-port-enable = 1
   # ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  #}

}




resource "yandex_compute_instance" "platform-2" {
  name        = local.db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_default_zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
    #cores         = var.vm_db_cores
   # memory        = var.vm_db_memory
    #core_fraction = var.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.demo.id}"
    nat       = true
  }

  metadata = local.meta-ssh
  #{
   # serial-port-enable = 1
    #ssh-keys           = "ubuntu:${var.ssh_meta.web.s-keys}"
    #"ubuntu:${var.vms_ssh_root_key}"
  }

