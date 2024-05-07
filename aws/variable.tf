# Terraform psylogical configuration
# variables.tf
# env: prod

variable "region" {
  description = "An aws region"
  type        = string
  default     = "eu-central-1"
}

variable "ami" {
  type = "map"
  default =  {
    buster  = "ami-0c53e44f6073d957e"  # debian 10 buster
    stretch = "ami-0134bbbf8dbf52a1c"  # debian  9 strech
  }
}

variable "key_name" {
  default = "smowky-aws"
}
