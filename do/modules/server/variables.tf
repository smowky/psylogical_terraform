# Terraform DO module server
# variables.tf


variable "smowky_pass" {
  description = "Hashed pass for smowky" 
  type        = string
  default     = "sabPU70QsK6ME"
}

variable "env" {
  description = "Working environment"
  type        = string
}

variable "region" {
  description = "Digitalocean servers location"
  type        = string
  default     = "fra1"
}

variable "image" {
  description = "ISO image to install"
  type        = string
  default     = "ubuntu-18-04-x64"
}
 
variable "ssh_private_key" {
  description = "SSH private key position"
  default     = "~/.ssh/id_rsa"
  type        = string
}

variable "size" {
  description = "Size of server/droplet"
  type        = string
}

variable "ipv6" {
  description = "Enable ipv6"
  type        = bool
  default     = true
}

variable "private_network" {
  description = "Enable private networking"
  type        = bool
  default     = true
}

variable "server_name" {
  description  = "Server name"
  type         = string
}

variable "tags" {
  description = "Server's tags"
  type        = list
}

variable "ssh_keys" {
  description = "SSH keys"
  type        = list
}

variable "floating_ip" {
  description = "If set to true, add floating IP addreees"
  type        = bool
  default     = false
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "domain" {
  description = "Overwrite default value"
  type        = string
}

variable "resize_disk" {
  description = "Whether or nor resize disk when updating droplet"
  type	      = bool
  default     = true
}
