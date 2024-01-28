locals {
  db_name = "${var.description_name}-${var.db}"
  web_name = "${var.description_name}-${var.web}"
  description = "в этой переменной собираем имя машины"
}

locals {
  meta-ssh = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  } 
}