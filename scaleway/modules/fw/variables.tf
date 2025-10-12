# Terraform scaleway firewall module

variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "env" {
  description = "Working environment"
  type        = string
}

variable "scaleway_zone" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
  type        = string
}

variable "fw_action" {
  description = "Accept or block"
  type        = string
  default     = "accept"
}

variable "fw_rules" {}

variable "fw_name" {
  description = "security group name"
  type        = string
}

variable "protocol" {
  description = "Protocol of port to be openned"
  type        = string
  default     = "tcp"
}

