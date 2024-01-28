#ресурсы для vm
variable "vm_web_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family of OS "
}

variable "vm_web_platform_name" {
  type    = string
  default = "netology-develop-platform-web"
  description = "name of platform"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
  description = "id platform"
}

#variable "vm_web_cores" {
#  default = 2
#}

#variable "vm_web_memory" {
#  default = 1
#}

#variable "vm_web_core_fraction" {
#  default = 5
#}

#Зона доступности для vm_web
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


#ресурсы для vm
variable "vm_web_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family of OS "
}

variable "vm_web_platform_name" {
  type    = string
  default = "netology-develop-platform-web"
  description = "name of platform"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
  description = "id platform"
}

#variable "vm_web_cores" {
#  default = 2
#}

#variable "vm_web_memory" {
#  default = 1
#}

#variable "vm_web_core_fraction" {
#  default = 5
#}

#Зона доступности для vm_web
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

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
    db = {
    cores = 2
    memory = 2
    core_fraction = 20
  }
  }
}


