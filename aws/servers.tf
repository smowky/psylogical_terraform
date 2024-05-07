# Terraform psylogical configuration
# servers.tf
# env: prod

resource "aws_instance" "web" {
  ami                    = "${lookup(var.ami, "stretch")}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.smowky_rsa_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web_security_group.id}",
                           ]
  tags = {
    Name        = "web"
    Environment = "prod"
  }
}

resource "aws_instance" "icinga" {
  ami                    = "${lookup(var.ami, "buster")}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.smowky_rsa_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.web_security_group.id}",
                           ]
  tags = {
    Name        = "icinga"
    Environment = "prod"
  }
}

#resource "aws_instance" "mail" {
#  ami                    = "${lookup(var.ami, "buster")}"
#  instance_type          = "t2.micro"
#  key_name               = "${aws_key_pair.smowky_rsa_key.key_name}"
#  vpc_security_group_ids = ["${aws_security_group.web_security_group.id}",
#                           ]
#  tags = {
#    Name        = "mail"
#    Environment = "prod"
#  }
#}
