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
  source      = "../modules/fw/"
  project_id  = var.project_id
  server_zone = var.server_zone
  env         = var.env

  fw_rules = local.trusted
  fw_name  = "fw01"
}

#################################################
# Instances
module "server02" {
  source        = "../modules/instance/"
  project_id    = var.project_id
  user_name     = var.user_name
  server_zone   = var.server_zone
  env           = var.env
  server_domain = var.server_domain

  server_name           = "server02"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-L"
  server_security_group = module.fw01.security_group_id
#  server_volume         = [module.disk01.volume_id]

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
  server_zone              = var.server_zone
  project_id               = var.project_id
  server_block_volume_size = 10
}
#################################################
# Output

output "project_name" {
  value = var.project_name
}

output "server02_hostname" {
  value = module.server02.server_name
}

output "server02_ip" {
  value = module.server02.server_ip
}

output "server02_state" {
  value = module.server02.server_state
}

