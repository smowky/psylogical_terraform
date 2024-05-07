# Terraform  default environment variables
# variables.tf

variable "token" {
  description = "Working environment"
  type        = string
}

variable "env" {
  description = "Working environment"
  type        = string
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "domain" {
  description = "Project domain name, used to construct server name"
  type        = string
}

variable "server_size" {
  description = "Size of server/droplet"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "resize_disk" {
  description  = "Whether or not resize disk"
  type         = bool
  default      = true
}

variable "ssh_private_key" {
  description = "SSH keys"
  type        = string
}
