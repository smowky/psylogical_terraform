variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "server_zone" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
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
variable "project_name" {
  description = "string to construct volume name"
  type        = string
}

variable "volume_name" {
  description = "string to construct volume name"
  type        = string
}
variable "env" {
  description = "environment that volume belong"
  type        = string
}

