# Terraform DO module firewall
# variables.tf

variable "env" {
  description = "Working environment"
  type        = string
}

variable "fw_name" {
  description  = "Firewall name"
  type         = string
}

variable "tags" {
  description = "Server's tags"
  type        = list
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "protocol" {
  description = "Protocol of port to be openned"
  type        = string
  default     = "tcp"
}

variable "source_addresses" {
  description = "List of source addresses, default to any"
  type        = list
  default     = ["0.0.0.0/0", "::/0"]
}
