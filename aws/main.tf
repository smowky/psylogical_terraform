# Configure the AWS Provider
provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-central-1"
  shared_credentials_file = "/home/smowky/.aws/credentials"
  profile                 = "smowky-aws"
}

# Terraform backend to store current runnign configuration
terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "psylogical" # org name from step 2.
        workspaces {
            name = "psylogical" # workspace prefix
        }
    }
}

resource "aws_key_pair" "smowky_rsa_key" {
  key_name   = "smowky-rsa-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC11/1E7FyxqIbs/qaTyYoJVPtU634VWantcHMYlZk7yq6COJzdDnN+rDx7oFUphBlutyMRnWDA4KyomPcDVCEt3gL31J7WT3uoIdQNqEaoh11BqdPJ9e0flC+BFMPyi3d+5ilyRw/ZPFDnJq3EO7coHbWvG1PEIYhtBULJuAS+goV8STTpLEcBFXOCWRxx5HEK4fGALzUfEc3QIMioE4eAbc0OW9d/LpumetTNUKtO2rFgDPWHJPRr2rrpblVJ6cKQxq8VKjfCXHvhs12xq+vYbDRbim50tw0St3r8xTNiFhF1rIXCU+Y9m2G+/5/V21A+2VOm+y/loo9RhULjb5hAbSdq2g/Z+7x3aF5+p/Ovz2g4ZvgvWwQlhoLCcyN9w/4NjTLY+I9EWJQP7mlYkBzv6lGXoBiyzK+dn0ievmJJ4mcCI8mi319xcuMkJNqdcs2VIHFvF/R7jhiDiRlHFgsm+bslwaAYarxY7I68RIwQy7CdXn6X+hj5jamWwbWAuTrHtUfPQqt5ztzG7GRKR6kzeA8ad5Ca4aDmcG9GMBpI6yWqXZcIZstxMYcKc0slZILV3/ACEBr3/6Aan0P74YcEjr50BLr8EUJvMuwJsogV4M65WbcPQFoSV8XNGSUsZC87WjUBgYxUepl1xmiDymy2+SJfZl5xGnnt6qAX5eDVaw== smowky@kosacka"
}

