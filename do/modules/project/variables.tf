# Terraform varible for module project
# variables.tf

variable "project_resources" {
  description = "URN identificator of server"
  type        = list
}

variable "project_description" {
  description = "Project description"
  type        = string
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

variable "env" {
  description = "Working environment"
  type        = string
}
