# Terraform environment variables


cf_domain = "slezarik.sk"

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
   "dkim": {
      dns_name: "email._domainkey.mg",
      dns_value: "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDF3DeOub/BAk0lrPKz7rQb0KIEmFUQa/gmiv1ntmpXZuIHMtb+/zJide7X/H7VDETNkcx4ruZHTsVcPyhH6jxHjT3ZyPl+5iM9SLZXnNRGe61IqOPuo8DBtAb9giuc1qn0T9jlxSdDha2nPGRZRi3KHkpcPMa20OIuFw3XXgbznQIDAQAB"
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
   "mx4": {
      dns_name: "@",
      dns_value: "sauron.psylogical.org"
      dns_type: "MX",
      dns_priority: 0
      dns_proxied: "false",
      dns_note: "psylogical mx record 2"
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
      dns_note: "dmarc record "
      dns_ttl: 600
   },
  "mailgun": {
      dns_name: "mailgun",
      dns_value: "smtp.eu.mailgun.org"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "mailgun smtp name to use in postfix"
      dns_ttl: 600
   },

}
