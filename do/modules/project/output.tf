# Terraform DO module project
# output.tf

output "project_name" {
  description = "Project name output value"
  value       = digitalocean_project.project.name
}
