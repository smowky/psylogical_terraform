resource "scaleway_block_volume" "data" {
  project_id = var.project_id
  zone       = var.server_zone
  name       = "volume-${var.env}"
  size_in_gb = var.server_block_volume_size
  iops       = var.server_block_volume_iops
}
