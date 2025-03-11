# Terraform scaleway firewall module

output security_group_id {
  value = scaleway_instance_security_group.security_group.id
}
