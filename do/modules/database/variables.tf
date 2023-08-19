# Terraform DO module database
# variables.tf

variable "env" {
  description = "Project environment"
  type        = string
}

variable "region" {
  description = "DB cluster region"
  type        = string
  default     = "fra1"
}

variable "db_name" {
  description = "DB cluster name without env suffix"
  type        = string
}

variable "db_engine" {
  description = "DB cluster engine,either pg,redis or mysql"
  type        = string
}

variable "db_version" {
  description = "PG only; version number"
  type        = number
}

variable "tags" {
  description = "DB cluster tags"
  type        = list
}

variable "cluster_size" {
  description = "DB cluster size"
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "node_count" {
  description = "Amount of running nodes in cluster"
  type        = number
  default     = "1"
}

variable "project_name" {
  description = "Project name to construct correct naming convention names"
  type        = string
}

