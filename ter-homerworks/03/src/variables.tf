###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "net-name" {
  type = string
  default = "develop"
  description = "name of net yandex"
}

variable "net-zone" {
  type = string
  default = "ru-central1-a"
  description = "net zone yandex"
}

variable "net-cidr" {
  type = string
  default = "['10.0.1.0/24']"
}
#  variable "vms_ssh_root_key" {
#    type = string
#    sensitive = true
#    default = file("~/.ssh/sanchez.pub")
#  }

variable "vms_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
    cores = 2
    memory = 1
    core_fraction = 5
  }
  }
}

variable "platform_id_v" {
  type = string
  default = "standard-v1"
  description = "ID platform on yandex cloud"
}

##### Диски яндекс
variable "disc_count" {
  type = number
  default = 2
}

variable "disk_size" {
  type = number
  default = 1
}
 
variable "hdd-type" {
  type = string
  default = "network-hdd"
}