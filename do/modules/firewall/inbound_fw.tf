# Terraform DO module firewall
# inbound_firewall.tf

resource "digitalocean_firewall" "firewall_inbound_custom" {
  name    = "${var.fw_name}.${var.env}.${var.project_name}-inbound"
  tags    = var.tags

  dynamic "inbound_rule" {
    for_each = var.inbound_ports

    content {
      protocol         = var.protocol
      port_range       = inbound_rule.value
      source_addresses = var.source_addresses 
    } 
  }
}
