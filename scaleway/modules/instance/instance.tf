# scaleway instance module
resource "scaleway_instance_ip" "ip" {

  project_id = var.project_id
  zone       = var.scaleway_zone
  type       = "routed_ipv4"
}

resource "scaleway_instance_server" "server" {
  depends_on = [scaleway_instance_ip.ip]
  project_id = var.project_id
  name       = "${var.server_name}.${var.env}.${var.server_domain}"
  type       = var.server_size
  image      = var.server_image
  zone       = var.scaleway_zone
  tags       = [var.server_name,var.scaleway_zone,var.env]

  security_group_id     = var.server_security_group
  ip_id                 = scaleway_instance_ip.ip.id
  additional_volume_ids = var.server_volume

  connection {
    user = "root"
    host = scaleway_instance_ip.ip.address
    type = "ssh"
    private_key = file(pathexpand("~/.ssh/id_rsa"))
    timeout = "3m"
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

  private_network {
    pn_id =       var.private_vpc_id
  }

  root_volume {
    delete_on_termination = var.root_volume_delete_on_termination
    size_in_gb            = var.root_volume_size_in_gb
  }

}
