# Terraform scaleway virtual private cloud

resource "scaleway_vpc" "vpc" {
  name       = (var.vpc_name == "" ? "vpc-${var.env}-${var.server_domain}" : var.vpc_name)
  tags       = [var.env, var.server_domain]
  region     = var.scaleway_region
  project_id = var.project_id
}

# Vritual private network
resource "scaleway_vpc_private_network" "pn_priv" {
  name       = (var.vpn_name == "" ? "vpn-${var.env}-${var.server_domain}" : var.vpn_name)
  tags       = [var.env, var.server_domain]
  region     = var.scaleway_region
  project_id = var.project_id
}

