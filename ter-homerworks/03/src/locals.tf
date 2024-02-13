locals {
  description  = "ssh key file"
  ssh_key_file = file("~/.ssh/sanchez.pub")
  sensitive = true
}