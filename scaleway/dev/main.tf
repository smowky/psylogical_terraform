# Main definition for scaleway provider
# env: dev

provider "scaleway" {
  access_key = var.scw_access_key
  secret_key = var.scw_secret_key
  zone = var.scaleway_zone
  region = var.scaleway_region


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

#data "scaleway_vpcs" "default {
#  name   = "default"
#  region = "nl-ams"
#}
#################################################
# Project
resource "scaleway_account_project" "project" {
  name = "${var.project_name}-${var.env}"
  organization_id = var.organization_id
}

##################################################
# Virtal private cloud
module "vpc" {
  source        = "../modules/vpc/"
  scaleway_region = var.scaleway_region
  env           = var.env
  project_id    = scaleway_account_project.project.id
  vpc_name      = "vpc01"
  server_domain = var.server_domain
}

###################################################
## Firewall
locals {
  trusted = [
    { ip = "0.0.0.0/0", port = "22" },
    { ip = "0.0.0.0/0", port = "80" },
    { ip = "0.0.0.0/0", port = "443" },
  ]
}

module "fw01" {
  source        = "../modules/fw/"
  project_id    = scaleway_account_project.project.id
  env           = var.env
  scaleway_zone = var.scaleway_zone

  fw_rules = local.trusted
  fw_name  = "fw01"
}

###################################################
## SSH
resource "scaleway_iam_ssh_key" "main" {
  name       = "main"
  public_key = var.ssh_public_key
  project_id    = scaleway_account_project.project.id
}

###################################################
### Instances
module "server01" {
  source        = "../modules/instance/"
  project_id    = scaleway_account_project.project.id
  user_name     = var.user_name
  
  scaleway_zone   = var.scaleway_zone
  env           = var.env
  server_domain = var.server_domain

  server_name           = "server01"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-S"
  server_security_group = module.fw01.security_group_id
  private_vpc_id = module.vpc.pn_id
#  server_volume         = [module.disk01.volume_id]
  user_pass = var.user_pass
}

module "server02" {
  source        = "../modules/instance/"
  project_id    = scaleway_account_project.project.id
  user_name     = var.user_name
  
  scaleway_zone   = var.scaleway_zone
  env           = var.env
  server_domain = var.server_domain

  server_name           = "server02"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-S"
  server_security_group = module.fw01.security_group_id
  private_vpc_id = module.vpc.pn_id
#  server_volume         = [module.disk01.volume_id]
  user_pass = var.user_pass
}

module "server03" {
  source        = "../modules/instance/"
  project_id    = scaleway_account_project.project.id
  user_name     = var.user_name
  scaleway_zone   = var.scaleway_zone

  env           = var.env
  server_domain = var.server_domain

  server_name           = "server03"
  server_image          = "ubuntu_jammy"
  server_size           = "DEV1-S"
  server_security_group = module.fw01.security_group_id
  private_vpc_id = module.vpc.pn_id
#  server_volume         = [module.disk01.volume_id]
  user_pass = var.user_pass
}

#################################################
# Volumes
module "disk01" {
  project_id    = scaleway_account_project.project.id
  source                   = "../modules/volume/"
  volume_name              = "disk01"
  env                      = var.env
  project_name             = var.project_name
  scaleway_zone            = var.scaleway_zone
  server_block_volume_size = 10
}
#################################################
## Output

output "project_name" {
  value = var.project_name
}

output "server01_hostname" {
  value = module.server01.server_name
}

output "server01_ip" {
  value = module.server01.server_ip
}

output "server01_state" {
  value = module.server01.server_state
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

output "server03_hostname" {
  value = module.server03.server_name
}

output "server03_ip" {
  value = module.server03.server_ip
}

output "server03_state" {
  value = module.server03.server_state
}

output "default_pn_name"{
  value = module.vpc.pn_name
}
