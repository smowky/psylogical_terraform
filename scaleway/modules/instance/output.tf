output server_name {
  value = scaleway_instance_server.server.name
}
output server_ip {
  value = scaleway_instance_ip.ip.address
}
output server_state {
  value = scaleway_instance_server.server.state
}
