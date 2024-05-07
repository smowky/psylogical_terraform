# Terraform DO module database
# output.tf

output "database_urn" {
  description = "URN identificator of Database cluster, necessary for  projects module"
  value       = digitalocean_database_cluster.db_cluster.urn
}

output "database_hostname" {
  description = "DB cluster hostname"
  value       = digitalocean_database_cluster.db_cluster.host
}

output "database_uri" {
  description = "DB cluster uri"
  value       = digitalocean_database_cluster.db_cluster.uri
}

output "database_private_uri" {
  description = "DB cluster private_uri"
  value       = digitalocean_database_cluster.db_cluster.private_uri
}

output "database_user" {
  description = "DB cluster login user"
  value       = digitalocean_database_cluster.db_cluster.user
}

output "database_pass" {
  description = "DB cluster login password"
  value       = digitalocean_database_cluster.db_cluster.password
}
