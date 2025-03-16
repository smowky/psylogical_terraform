resource "scaleway_instance_ip" "ip" {

  project_id = var.project_id
  zone       = var.server_zone
  type       = "routed_ipv4"
}

resource "scaleway_instance_server" "server" {
  depends_on = [scaleway_instance_ip.ip]
  project_id = var.project_id
  name       = "${var.server_name}.${var.env}.${var.server_domain}"
  type       = var.server_size
  image      = var.server_image
  zone       = var.server_zone
  tags       = [var.server_name, var.env]

  security_group_id     = var.server_security_group
  ip_id                 = scaleway_instance_ip.ip.id
  additional_volume_ids = var.server_volume

  connection {
    user = "root"
    host = self.public_ip
    type = "ssh"
    # private_key = file(pathexpand("~/.ssh/id_rsa"))
    timeout = "2m"
  }

  provisioner "remote-exec" {

    inline = [
      "export PATH=$PATH:/usr/bin",
      "useradd --password ${var.user_pass} -s /bin/bash ${var.user_name} -m -G sudo",
      "mkdir -p /home/${var.user_name}/.ssh/",
      "cp /root/.ssh/authorized_keys /home/${var.user_name}/.ssh/",
      "chown ${var.user_name}:${var.user_name} /home/${var.user_name}/.ssh/authorized_keys",
      "hostnamectl set-hostname ${self.name}",
    ]
  }

}
