# Terraform environment variables


cf_domain = "psylogical.org"

dns_records = {
   "main_domain_name": {
      dns_name: "@",
      dns_value: "138.68.89.151"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "default web record"
      dns_ttl: 600
   },
   "www": {
      dns_name: "www",
      dns_value: "138.68.89.151"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "www subdomain"
      dns_ttl: 600
   },
   "mg": {
      dns_name: "mg",
      dns_value: "v=spf1 include:mailgun.org ~all"
      dns_type: "TXT",
      dns_priority: null 
      dns_proxied: "false",
      dns_note: "mailgun spf record"
      dns_ttl: 600
   },   
   "mta._domainkey": {
      dns_name: "mta._domainkey.mg",
      dns_value: "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCm+1p8Scd2b+5XM1H1piA2UI+eqJa/R065AlD+Ly0InLRDoLmki0DZoko8yWFmuVbxW6cutFIkdbK1IQwQvkbwWhuFl8XvXz3pdr66AReI+jvj32+/ZBi04pWD2Pllaa04aITGFE9KqhrwnvPaFs1DBHfhnFieTPuFstXTEPWceQIDAQAB"
      dns_type: "TXT",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "mailgun dkim record"
      dns_ttl: 600
   },
   "mx1": {
      dns_name: "mg",
      dns_value: "mxa.eu.mailgun.org"
      dns_type: "MX",
      dns_priority: 10
      dns_proxied: "false",
      dns_note: "mailgun mx record 1"
      dns_ttl: 600
   },
   "mx2": {
      dns_name: "mg",
      dns_value: "mxb.eu.mailgun.org"
      dns_type: "MX",
      dns_priority: 10
      dns_proxied: "false",
      dns_note: "mailgun mx record 2"
      dns_ttl: 600
   },
   "mx3": {
      dns_name: "@",
      dns_value: "rohan.psylogical.org"
      dns_type: "MX",
      dns_priority: 10
      dns_proxied: "false",
      dns_note: "psylogical mx record 1"
      dns_ttl: 600
   },
  "email.mg": {
      dns_name: "email.mg",
      dns_value: "eu.mailgun.org"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "mailgun tracking cname"
      dns_ttl: 600
   },
   "dmarc_record": {
      dns_name: "_dmarc",
      dns_value: "v=DMARC1; p=none; rua=mailto:postmaster@slezarik.sk"
      dns_type: "TXT",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "dmarc record"
      dns_ttl: 600
   },

##################################################
# Servers
   "edoras": {
      dns_name: "edoras",
      dns_value: "rohan.psylogical.org"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "iredmail postmaster"
      dns_ttl: 600
   },
   "gondor": {
      dns_name: "gondor",
      dns_value: "159.223.19.8"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "nextcloud"
      dns_ttl: 600
   },
   "rohan": {
      dns_name: "rohan",
      dns_value: "46.101.128.144"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "iredmail"
      dns_ttl: 600
   },
   "arnor": {
      dns_name: "arnor",
      dns_value: "138.68.89.151"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "web hosting"
      dns_ttl: 600
   },
   "dale": {
      dns_name: "dale",
      dns_value: "134.209.255.93"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "ZM project - qfieldcloud"
      dns_ttl: 600
   },
   "mirkwood": {
      dns_name: "mirkwood",
      dns_value: "139.59.209.16"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "ZM project - mergin"
      dns_ttl: 600
   },
   "mordor": {
      dns_name: "mordor",
      dns_value: "51.15.47.175"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "scaleway iredmail server"
      dns_ttl: 600
   },
   "thorin": {
      dns_name: "thorin",
      dns_value: "51.15.51.92"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "scaleway iredmail server"
      dns_ttl: 600
   },
   "mergin": {
      dns_name: "mergin",
      dns_value: "mirkwood.psylogical.org"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "ZM project - mergin"
      dns_ttl: 600
   },
   "qfieldcloud": {
      dns_name: "qfieldcloud",
      dns_value: "dale.psylogical.org"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "ZM project - qfieldcloud"
      dns_ttl: 600
   },
   "web": {
      dns_name: "web",
      dns_value: "18.185.138.3"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "web hosting server"
      dns_ttl: 600
   },
   "nc": {
      dns_name: "nc",
      dns_value: "31.31.72.221"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "web hosting server"
      dns_ttl: 600
   },
   "oo": {
      dns_name: "oo",
      dns_value: "31.31.72.221"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "web hosting server"
      dns_ttl: 600
   },
   "sauron": {
      dns_name: "sauron",
      dns_value: "51.15.103.113"
      dns_type: "A",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "email solution on scaleway provider"
      dns_ttl: 600
   },
}
