# Terraform DO module space
# variables.tf

variable "env" {
  description = "Working environment"
  type        = string
}

variable "space_name" {
  description  = "Space name"
  type         = string
}

variable "region" {
  description = "Space region"
  type        = string
  default     = "fra1"
}

variable "acl" {
  description = "Access list, its either private or public-read"
  type        = string
  default     = "private"
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "force_destroy" {
  description = "Allow to destroy the bucket if it is not empty"
  type = bool
  default = false
}
