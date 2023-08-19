output "dns_records" {
  value = {
    for record, attrs  in resource.cloudflare_record.records : record =>
    {
       name: attrs.name,
       hostname: attrs.hostname,
       value: attrs.value,
       type: attrs.type
       ttl: attrs.ttl,
       proxied: attrs.proxied
    }
  }
}
