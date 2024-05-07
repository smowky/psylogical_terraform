# Terraform DO module space
# space.tf

resource "digitalocean_spaces_bucket" "space" {
  name   = "${var.space_name}-${var.env}-${var.project_name}"
  region = var.region
  acl    = var.acl
  force_destroy = var.force_destroy
}
