# Terraform DO module database
# database.tf

resource "digitalocean_database_cluster" "db_cluster" {
  name       = "${var.db_name}-${var.env}-${var.project_name}"
  engine     = var.db_engine
  version    = var.db_version
  size       = var.cluster_size
  region     = var.region
  tags       = var.tags
  node_count = var.node_count
}

