# Terraform DO module server
# servers.tf

resource "digitalocean_droplet" "server" {

  image              = var.image
  name               = "${var.server_name}.${var.project_name}.${var.domain}"
  region             = var.region
  size               = var.size
  ipv6               = var.ipv6
  tags               = var.tags 
  ssh_keys           = var.ssh_keys
  resize_disk        = var.resize_disk

  connection {
    user        = "root"
    host        = self.ipv4_address
    type        = "ssh"
    # private_key = file(pathexpand("~/.ssh/id_rsa"))
    timeout     = "2m"
  }

  provisioner "remote-exec" {

    inline = [
      "export PATH=$PATH:/usr/bin",
      "useradd --password ${var.smowky_pass} -s /bin/bash smowky -m -G sudo",
      "mkdir -p /home/smowky/.ssh/",
      "cp /root/.ssh/authorized_keys /home/smowky/.ssh/",
      "chown smowky:smowky /home/smowky/.ssh/authorized_keys",
      "hostnamectl set-hostname ${self.name}",
    ]
  }
}

resource "digitalocean_floating_ip" "floating_ip" {
  count = var.floating_ip ? 1 : 0

  region      = var.region
}

resource "digitalocean_floating_ip_assignment" "floating_ip" {
  count = var.floating_ip ? 1 : 0

  ip_address  = digitalocean_floating_ip.floating_ip[count.index].ip_address
  droplet_id  = digitalocean_droplet.server.id
}

