resource "scaleway_iam_ssh_key" "main" {
  name       = "main"
  public_key = var.ssh_public_key
  project_id = var.project_id
}
