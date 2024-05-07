# Terraform DO module space
# output.tf

output "space_urn" {
  value       = digitalocean_spaces_bucket.space.urn
  description = "URN identificator of server, used in projects module"
}

output "space_url" {
  description = "Space bucket URL"
  value       = digitalocean_spaces_bucket.space.bucket_domain_name
}
