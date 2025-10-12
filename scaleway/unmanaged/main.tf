# Main definition for scaleway provider
# env: UNMANAGED

################################################
###  BEWARE
###  This is unmanaged workspace, do not use terraform here
###
################################################

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
      name = "psylogical_scaleway_prod" # workspace name THIS IS UNMANAGED NAMESPACE 
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
module "www" {
  source      = "../modules/fw/"
  project_id  = var.project_id
  scaleway_zone = var.scaleway_zone
  env         = var.env

  fw_rules = local.trusted
  fw_name  = "www"
}

#################################################
# Instances
module "mordor" {
  source        = "../modules/instance/"
  project_id    = var.project_id
  user_name     = var.user_name
  scaleway_zone   = var.scaleway_zone
  env           = var.env
  server_domain = var.server_domain

  server_name           = "mordor"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-L"
  server_security_group = module.www.security_group_id
#  server_volume         = [module.disk01.volume_id]
  user_pass = var.user_pass

}

module "gisquick" {
  source        = "../modules/instance/"
  project_id    = var.project_id
  user_name     = var.user_name
  scaleway_zone   = var.scaleway_zone
  env           = var.env
  server_domain = var.server_domain

  server_name           = "gisquick"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-L"
  server_security_group = module.www.security_group_id
#  server_volume         = [module.disk01.volume_id]
  user_pass = var.user_pass

}

#################################################
# SSH
resource "scaleway_iam_ssh_key" "main" {
  name       = "main"
  public_key = var.ssh_public_key
  project_id = var.project_id
}


#################################################
# Volumes

module "disk01" {
  source                   = "../modules/volume/"
  volume_name              = "disk01"
  env                      = var.env
  project_name             = var.project_name
  scaleway_zone              = var.scaleway_zone
  project_id               = var.project_id
  server_block_volume_size = 10
}
#################################################
# Output

output "project_name" {
  value = var.project_name
}

output "mordor_hostname" {
  value = module.mordor.server_name
}

output "mordor_ip" {
  value = module.mordor.server_ip
}

output "mordor_state" {
  value = module.mordor.server_state
}

output "gisquick_hostname" {
  value = module.gisquick.server_name
}

output "gisquick_ip" {
  value = module.gisquick.server_ip
}

output "gisquick_state" {
  value = module.gisquick.server_state
}

