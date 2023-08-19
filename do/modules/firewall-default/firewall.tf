# Terraform DO module firewall
# firewall.tf

resource "digitalocean_firewall" "firewall_default" {
  name    = "${var.fw_name}.${var.env}.${var.project_name}-default"
  tags    = var.tags

  inbound_rule {
    protocol   = "tcp"
    port_range = "1-65535"
    source_tags =  var.tags
  }

  inbound_rule {
    protocol   = "udp"
    port_range = "1-65535"
    source_tags = var.tags
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
