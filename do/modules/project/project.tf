# Terraform DO module project
# project.tf

resource "digitalocean_project" "project" {

  name        = "TF ${var.project_name} ${var.env}"
  description = var.project_description
  resources   = var.project_resources
}
