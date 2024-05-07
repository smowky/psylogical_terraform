# Terraform environment variables


cf_domain = "feropolopate.cz"

dns_records = {
   "main_domain_name": {
      dns_name: "@",
      dns_value: "18.185.138.3"
      dns_priority: null,
      dns_type: "A",
      dns_proxied: "false",
      dns_note: "internal DNS record for wikipedia"
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
      dns_value: "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmRMrfHFOnE9OIF9/51ev2ZueufH+3mTbEB2Dd5VEfIh2B4oKfxpEr4ByGarFcNp3hVWl+ube9S47aTNzWItx/KuCYTKTZACCHZWTlNpRV9iOqpszEpXtei5CU5PWhtF/1WAchVGzW720oCUITcUBIvUfeKLX4QChEw3gWFyzKpwIDAQAB"
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
      dns_note: "dmarc record "
      dns_ttl: 600
   },

}
