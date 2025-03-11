variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "scw_access_key" {
  type        = string
  description = "Access key"
}

variable "scw_secret_key" {
  type        = string
  description = "Secret key"
}

variable "env" {
  description = "Working environment"
  type        = string
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "ssh_public_key" {
  description = "Creates and manages Scaleway IAM SSH Keys."
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

variable "server_zone" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
  type        = string
}

variable "server_domain" {
  description = "User main dns domain name.tld"
  type        = string
}

variable "server_block_volume_size" {
  description = "The scaleway_block_volume resource is used to create and manage Scaleway Block Storage volumes."
  type        = number
}

variable "server_block_volume_iops" {
  description = "The scaleway_block_volume resource is used to create and manage Scaleway Block Storage volumes."
  type        = number
  default     = 5000
}

variable "smowky_pass" {
  description = "Hashed pass for smowky"
  type        = string
  default     = "sabPU70QsK6ME"
}
