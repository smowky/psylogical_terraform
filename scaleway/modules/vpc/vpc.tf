# Terraform scaleway vpc module

resource "scaleway_vpc" "vpc" {
  name       = (var.vpc_name == "" ? "vpc-${var.env}-${var.server_domain}" : var.vpc_name)
  tags       = [var.env, var.server_domain]
  region     = var.scaleway_region
  project_id = var.project_id
}
