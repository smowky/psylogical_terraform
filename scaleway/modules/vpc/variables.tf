variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "scaleway_region" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
  type        = string
}

variable "server_domain" {
  description = "string to construct volume name"
  type        = string
}

variable "vpc_name" {
  description = "string to construct volume name"
  type        = string
  default     = ""
}

variable "vpn_name" {
  description = "string to construct volume name"
  type        = string
  default     = ""
}

variable "env" {
  description = "environment that volume belong"
  type        = string
}

