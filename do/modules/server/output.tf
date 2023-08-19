# Terraform DO module server
# output.tf

output "server_name" {
  value = digitalocean_droplet.server.name 
}

output "server_ip" {
  value = digitalocean_droplet.server.ipv4_address
}

output "server_ipv6" {
  value = digitalocean_droplet.server.ipv6_address
}

output "server_urn" {
  description = "URN identificator of server, used in projects module"
  value       = digitalocean_droplet.server.urn
}

output "server_id" {
  description = "ID identificator of server, used in module volume"
  value       = digitalocean_droplet.server.id
}
