variable "description_name" {
  default = "netology-develop-platform"
}

variable "db" {
  default = "db"
}

variable "web" {
  default = "web"
}

###cloud vars

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  sensitive   = true
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#имя создаваемой сети

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network"

}
#первая подсеть
variable "dev_vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC subnet name for web"
}
#вторая подсеть
variable "demo_vpc_name" {
  type        = string
  default     = "demo"
  description = "VPC subnet name for db"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}