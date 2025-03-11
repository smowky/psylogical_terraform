# Main definition for scaleway provider
# env: prod

provider "scaleway" {
  access_key = var.scw_access_key
  secret_key = var.scw_secret_key
}


# Terraform backend to store current running configuration
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "psylogical" # organization name in terraform cloud
    workspaces {
      name = "psylogical_scaleway_dev" # workspace name
    }
  }
}

#################################################
# Firewall
locals {
  trusted = [
    { ip = "0.0.0.0/0", port = "22" },
    { ip = "0.0.0.0/0", port = "80" },
    { ip = "0.0.0.0/0", port = "443" },
  ]
}
module "fw01" {
  source = "../modules/fw/"
  project_id              = var.project_id
  server_zone                    = var.server_zone
  env             = var.env

  fw_rules            = local.trusted
  fw_name = "fw01"
}

