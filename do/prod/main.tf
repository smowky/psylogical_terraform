# Main definition for DO provider
# env: prod

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token   = var.token
}

# Terraform backend to store current running configuration
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "psylogical" # organization name in terraform cloud
    workspaces {
      name = "psylogical_do_prod" # workspace name
    }
  }
}


# Do not forget to add every server/module to project module definition

module "project" {
  source = "../modules/project/"

  env                 = var.env
  project_name        = var.project_name
  project_description = "psylogical production servers"
  project_resources   = [
    module.gondor.server_urn,
    module.rohan.server_urn,
    module.arnor.server_urn,
    module.dale.server_urn,
    module.mirkwood.server_urn,
    #    module.cdn.server_urn,
#    module.volume-gondor.volume_urn,

]
}

# TF 0.12 is unable to iterate modules and DO is unable to parse droplet data source as list https://www.terraform.io/docs/providers/do/d/droplet.html
# so in turn you have to defined 1 server per 1 module definition and the and it to project, otherwise there will be a mess in web UI 

#################################################
# SSH key

resource "digitalocean_ssh_key" "smowky_ssh_key" {
  name       = "Terraform Example"
  public_key = file("/home/smowky/.ssh/id_rsa.pub")
}

resource "digitalocean_ssh_key" "smowky_ecdsa_key" {
  name       = "Smowky ECDSA key"
  public_key = file("/home/smowky/.ssh/id_ed25519.pub")
}

#################################################
# Servers

module "gondor" {
  source = "../modules/server/"

  server_name  = "gondor" 
  tags         = [ var.env, "gondor"  ]

  env          = var.env
  project_name = var.project_name
  domain       = var.domain
  size         = "s-2vcpu-2gb"
  ssh_keys     = [digitalocean_ssh_key.smowky_ssh_key.fingerprint]
  floating_ip  = false
  resize_disk  = false
  image        = "ubuntu-20-04-x64"
}

module "rohan" {
  source = "../modules/server/"

  server_name  = "rohan" 
  tags         = [ var.env, "rohan"  ]

  env          = var.env
  project_name = var.project_name
  domain       = var.domain
  size         = "s-1vcpu-2gb"
  ssh_keys     = [digitalocean_ssh_key.smowky_ssh_key.fingerprint]
  floating_ip  = false
  resize_disk  = false
  image        = "ubuntu-20-04-x64"

}

module "arnor" {
  source = "../modules/server/"

  server_name  = "arnor" 
  tags         = [ var.env, "arnor"  ]

  env          = var.env
  project_name = var.project_name
  domain       = var.domain
  size         = "s-1vcpu-2gb"
  ssh_keys     = [digitalocean_ssh_key.smowky_ssh_key.fingerprint]
  floating_ip  = false
  resize_disk  = false
  image        = "ubuntu-20-04-x64"

}

module "dale" {
  source = "../modules/server/"

  server_name  = "dale" 
  tags         = [ var.env, "dale"  ]

  env          = var.env
  project_name = var.project_name
  domain       = var.domain
  size         = "s-2vcpu-4gb"
  ssh_keys     = [digitalocean_ssh_key.smowky_ssh_key.fingerprint]
  floating_ip  = false
  resize_disk  = false
  image        = "ubuntu-20-04-x64"

}

module "mirkwood" {
  source = "../modules/server/"

  server_name  = "mirkwood"
  tags         = [ var.env, "mirkwood"  ]

  env          = var.env
  project_name = var.project_name
  domain       = var.domain
  size         = "s-2vcpu-4gb"
  ssh_private_key = var.ssh_private_key
  ssh_keys     = [digitalocean_ssh_key.smowky_ecdsa_key.id]
  floating_ip  = false
  resize_disk  = false
  image        = "ubuntu-24-04-x64"

}

#module "cdn" {
#  source = "../modules/server/"
#
#  server_name  = "cdn"
#  tags         = [ var.env, "cdn"  ]
#
#  env          = var.env
#  project_name = var.project_name
#  domain       = var.domain
#  size         = "s-4vcpu-8gb"
#  ssh_private_key = var.ssh_private_key
#  ssh_keys     = [digitalocean_ssh_key.smowky_ecdsa_key.id]
#  floating_ip  = false
#  resize_disk  = false
#  image        = "debian-12-x64"
#
#}

#################################################
# Firewall

module "fw00-firewall-default" {
  source = "../modules/firewall-default/"

  fw_name      = "fw00-default"
  env          = var.env
  project_name = var.project_name
  tags         = [var.env, ]
}

module "fw01" {
  source = "../modules/firewall/"

  fw_name         = "fw01-ssh"
  env             = var.env
  project_name    = var.project_name
  tags            = [ var.env, ]
  inbound_ports   = [ "22" ]
}

module "fw07" {
  source = "../modules/firewall/"

  fw_name       = "fw07-web-allow-all"
  env           = var.env
  project_name  = var.project_name
  tags          = [ var.env ]
  inbound_ports = ["443", "80" ]
  source_addresses = ["0.0.0.0/0", "::/0"]
}

module "mail" {
  source = "../modules/firewall/"

  fw_name       = "fw-mail"
  env           = var.env
  project_name  = var.project_name
  tags          = [ "rohan" ]
  inbound_ports = ["25", "110", "995", "143", "993", "587", "389" ]
  source_addresses = ["0.0.0.0/0", "::/0"]
}

################################################
# Volumes

module "volume-mirkwood" {
  source = "../modules/volume"

  volume_name  = "volume-mirkwood"
  project_name = var.project_name
  env          = var.env
  size         = 100
  description  = "Mergin data"
  attach_to    = module.mirkwood.server_id
}

#################################################
# Output

output "project_name" {
  value = module.project.project_name
}

output "gondor_hostname" {
  value = module.gondor.server_name
}

output "gondor_ip" {
  value = module.gondor.server_ip
}

output "rohan_hostname" {
  value = module.rohan.server_name
}

output "rohan_ip" {
  value = module.rohan.server_ip
}

output "arnor_hostname" {
  value = module.arnor.server_name
}

output "arnor_ip" {
  value = module.arnor.server_ip
}

output "dale_hostname" {
  value = module.dale.server_name
}

output "dale_ip" {
  value = module.dale.server_ip
}

#output "cdn_hostname" {
#  value = module.cdn.server_name
#}
#
#output "cdn_ip" {
#  value = module.cdn.server_ip
#}

output "mirkwood_hostname" {
  value = module.mirkwood.server_name
}

output "mirkwood_ip" {
  value = module.mirkwood.server_ip
}
