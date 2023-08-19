# Main definition for CF provider
# env: test

# Configure the Cloudflare Provider

# Configure the Cloudflare provider using the required_providers stanza required with Terraform 0.13 and beyond
# You may optionally use version directive to prevent breaking changes occurring unannounced.

# Terraform backend to store current running configuration
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "psylogical" # organization name in terraform cloud
    workspaces {
      name = "psylogical_cf_feropolopate" # workspace name
    }
  }
}


provider "cloudflare" {
  api_token   = var.token 
  email	      = var.email
}


resource "cloudflare_zone" "feropolopate" {
    zone = var.cf_domain
}

resource "cloudflare_zone_settings_override" "config" {
    zone_id = cloudflare_zone.feropolopate.id
    settings {
      tls_1_3 = "on"
    }
}

resource "cloudflare_record" "records" {

  for_each = var.dns_records

  zone_id = cloudflare_zone.feropolopate.id 
  name    = each.value["dns_name"]
  value   = each.value["dns_value"]
  type    = each.value["dns_type"]
  priority= each.value["dns_priority"]
  proxied = each.value["dns_proxied"]
  ttl     = each.value["dns_ttl"]

}

