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

variable "server_zone" {
  description = "The zone you want to target. https://www.scaleway.com/en/developers/api/instance/#path-instances-list-all-instances"
  type        = string
}

