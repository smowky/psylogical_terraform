# Terraform environment variables


cf_domain = "bout.cz"

dns_records = {
   "main_domain_name": {
      dns_name: "@",
      dns_value: "138.68.89.151"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "main domain record"
      dns_ttl: 600
   },
   "www": {
      dns_name: "www",
      dns_value: "bout.cz"
      dns_priority: null,
      dns_type: "CNAME",
      dns_proxied: "false",
      dns_note: "www cname"
      dns_ttl: 600
   },
   "google-verification": {
      dns_name: "@",
      dns_value: "google-site-verification=Qp9nJUs3Acz2oT4O8UxZn38oKkcAmp-jJr73FCyoSG8"
      dns_priority: null,
      dns_type: "TXT",
      dns_proxied: "false",
      dns_note: "www cname"
      dns_ttl: 600
   },
   "mg": {
      dns_name: "mg",
      dns_value: "v=spf1 include:mailgun.org include:_spf.google.com include:_spf.myshoptet.com ~all"
      dns_type: "TXT",
      dns_priority: null 
      dns_proxied: "false",
      dns_note: "mailgun spf record"
      dns_ttl: 600
   },   
   "mta._domainkey": {
      dns_name: "mta._domainkey.mg",
      dns_value: "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDke92P4DDQCi1+5YZWQBP4LMMNRaMitscaPN9h8jAoe7x2bTqZfXGQoLrDFLGkeEa3ddddvZmJZ1UlQu4bWx1dtxDKiGBOmo0HH6LGRQKHRCW26IF5TibJRoNdvq3RhiDIn4VzNwT0Z8uOQyCcCMa2qDK/fakItrbbaZG56sEsVwIDAQAB"
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
# Shoptet eshop
   "shoptet._domainkey": {
      dns_name: "shoptet._domainkey",
      dns_value: "dkim.shoptet.cz"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "shoptet dkim"
      dns_ttl: 600
   },
   "eshop": {
      dns_name: "eshop",
      dns_value: "www.myshoptet.com"
      dns_type: "CNAME",
      dns_priority: null
      dns_proxied: "false",
      dns_note: "shoptet cname eshop"
      dns_ttl: 600
   },
}
