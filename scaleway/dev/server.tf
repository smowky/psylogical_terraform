resource "scaleway_instance_ip" "ip" {
  project_id = var.project_id
  zone       = var.server_zone
  type       = "routed_ipv4"
}

resource "scaleway_instance_server" "server" {
  depends_on = [scaleway_instance_ip.ip]
  project_id = var.project_id
  name       = "test-server.${var.env}.${var.server_domain}"
  type       = var.server_size
  image      = var.server_image
  zone       = var.server_zone
  tags       = ["test-server", var.env]

  security_group_id     = scaleway_instance_security_group.www.id
  ip_id                 = scaleway_instance_ip.ip.id
  additional_volume_ids = [scaleway_block_volume.data.id]
}


output "server_name" {
  value = scaleway_instance_server.server.name
}
output "server_ip" {
  value = scaleway_instance_server.server.public_ip
}
output "server_state" {
  value = scaleway_instance_server.server.state
}
