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
