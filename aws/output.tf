# Terraform psylogical configuration
# output.tf
# env: prod

output "web_public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "web_private_ip" {
  value = "${aws_instance.web.private_ip}"
}

output "icinga_public_ip" {
  value = "${aws_instance.icinga.public_ip}"
}

output "icinga_private_ip" {
  value = "${aws_instance.icinga.private_ip}"
}

#output "mail_public_ip" {
#  value = "${aws_instance.mail.public_ip}"
#}
#
#output "mail_private_ip" {
#  value = "${aws_instance.mail.private_ip}"
#}
