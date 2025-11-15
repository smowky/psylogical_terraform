variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "env" {
  description = "Working environment"
  type        = string
}

variable "server_size" {
  description = "Scaleway server size"
  type        = string
}

variable "server_image" {
  description = "server image os"
  type        = string
}

variable "scaleway_zone" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
  type        = string
}

variable "server_domain" {
  description = "User main dns domain name.tld"
  type        = string
}

variable "server_name" {
  description = "First left FQDN record"
  type        = string
}

variable "server_volume" {
  description = "First left FQDN record"
  default = []
}
variable "private_vpc_id" {
  description = "virtual network id"
  default = null
}

variable "user_pass" {
  description = "Hashed pass for user"
  type        = string
}

variable "user_name" {
  description = "Hashed pass for user"
  type        = string
}

variable "server_security_group" {
  description = "resource module name for server firewall"
  type        = string
}

variable "root_volume_delete_on_termination" {
  type = bool
}
variable "root_volume_size_in_gb" {
  type = number
  description = "size of root disk"
}
