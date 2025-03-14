resource "scaleway_instance_ip" "ip" {
  project_id = var.project_id
  zone       = var.server_zone
  type       = "routed_ipv4"
}

#resource "scaleway_instance_server" "server" {
#  depends_on = [scaleway_instance_ip.ip]
#  project_id = var.project_id
#  name       = "test-server.${var.env}.${var.server_domain}"
#  type       = var.server_size
#  image      = var.server_image
#  zone       = var.server_zone
#  tags       = ["test-server", var.env]
#
##  security_group_id     = scaleway_instance_security_group.www.id  !!no module!!
#  security_group_id     = module.fw01.security_group_id
#  ip_id                 = scaleway_instance_ip.ip.id
#  additional_volume_ids = [scaleway_block_volume.data.id]
#
#  connection {
#    user        = "root"
#    host        = self.public_ip
#    type        = "ssh"
#    # private_key = file(pathexpand("~/.ssh/id_rsa"))
#    timeout     = "2m"
#  }
#
#  provisioner "remote-exec" {
#
#    inline = [
#      "export PATH=$PATH:/usr/bin",
#      "useradd --password ${var.smowky_pass} -s /bin/bash smowky -m -G sudo",
#      "mkdir -p /home/smowky/.ssh/",
#      "cp /root/.ssh/authorized_keys /home/smowky/.ssh/",
#      "chown smowky:smowky /home/smowky/.ssh/authorized_keys",
#      "hostnamectl set-hostname ${self.name}",
#    ]
#  }
#
#
#}


#output "server_name" {
#  value = scaleway_instance_server.server.name
#}
#output "server_ip" {
#  value = scaleway_instance_server.server.public_ip
#}
#output "server_state" {
#  value = scaleway_instance_server.server.state
#}
