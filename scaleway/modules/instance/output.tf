output server_name {
  value = scaleway_instance_server.server.name
}
output server_ip {
  value = scaleway_instance_server.server.public_ip
}
output server_state {
  value = scaleway_instance_server.server.state
}
