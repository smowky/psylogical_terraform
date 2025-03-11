# Terraform scaleway firewall module

resource "scaleway_instance_security_group" "security_group" {
  project_id              = var.project_id
  name                    = "${var.fw_name}-${var.env}"
  zone                    = var.server_zone
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  dynamic "inbound_rule" {
    for_each = var.fw_rules

    content {
      action     = var.fw_action
      port       = inbound_rule.value.port
      ip_range   = inbound_rule.value.ip
    }
  }
}

