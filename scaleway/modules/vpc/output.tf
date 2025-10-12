output "vpc_id" {
  value = scaleway_vpc.vpc.id
}

output "vpc_name" {
  value = scaleway_vpc.vpc.name
}

output "vpn_id" {
  value = scaleway_vpc_private_network.pn_priv.id
}
