# Terraform DO module volume
# volume.tf

resource "digitalocean_volume" "volume" {
  name                    = "${var.volume_name}-${var.env}-${var.project_name}"
  region                  = var.region
  size                    = var.size
  description             = var.description
}

resource "digitalocean_volume_attachment" "volume_attachment" {
  droplet_id = var.attach_to
  volume_id  = digitalocean_volume.volume.id
}
