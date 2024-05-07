# Terraform psylogical configuration
# security_groups.tf
# env: prod

# Security groups

resource "aws_security_group" "web_security_group" {
  name = "web_security_group"
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8"
    to_port     = "0"
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Icinga port"
    from_port   = "5665"
    to_port     = "5665"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Icinga port"
    from_port   = "5665"
    to_port     = "5665"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

}
