# Terraform DO module volume
# output.tf

output "volume_urn" {
  value       = digitalocean_volume.volume.urn
  description = "URN identificator of server, used in projects module"
}

