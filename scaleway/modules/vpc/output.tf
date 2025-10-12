output "vpc_id" {
  value = scaleway_vpc.vpc.id
}

output "vpc_name" {
  value = scaleway_vpc.vpc.name
}

output "pn_id" {
  value = scaleway_vpc_private_network.pn_priv.id
}

output "pn_name" {
  value = scaleway_vpc_private_network.pn_priv.name
}

output "pn_subnet" {
  value = scaleway_vpc_private_network.pn_priv.ipv4_subnet
}
