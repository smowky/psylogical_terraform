# Terraform DO module volume
# variables.tf

variable "env" {
  description = "Working environment"
  type        = string
}

variable "volume_name" {
  description  = "Volume  name"
  type         = string
}

variable "region" {
  description = "Volume region"
  type        = string
  default     = "fra1"
}

variable "size" {
  description = "Volume size"
  type        = number
}

variable "description" {
  description = "Volume description"
  type        = string
  default     = "Watch out, you've forgot to add an volume description"
}

variable "attach_to" {
  description = "Droplet id of server to have volume attached"
  type        = string
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}
