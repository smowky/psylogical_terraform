# Terraform environment variables


cf_domain = "slezarikovi.love"

dns_records = {
   "main_domain_name": {
      dns_name: "@",
      dns_value: "51.158.163.158"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "main dns record"
      dns_ttl: 600
   },
   "www": {
      dns_name: "www",
      dns_value: "51.158.163.158"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "www subdomain"
      dns_ttl: 600
   }
}
