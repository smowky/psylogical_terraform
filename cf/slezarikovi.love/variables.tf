# terraform variables
# provider: CF
# env: prod

variable "token" {
  description = "account api token"
  type        = string
}

variable "email" {
  description = "account email"
  type        = string
}


variable "cf_domain" {
  description = "zone domain name"
  type        = string
}

variable "dns_records" {
  description = "List of dns records to create"
  type = map(any)
  default = {}
}


