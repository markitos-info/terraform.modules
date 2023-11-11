terraform {
  required_version = "1.6.2"

  required_providers {
    local = {
      source = "hashicorp/local"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }
}

provider "aws" {
  access_key = local.environment_data.AWS_ACCESS_KEY
  secret_key = local.environment_data.AWS_SECRET_ACCESS_KEY
  region     = local.environment_data.AWS_REGION
}

locals {
  environment_data = { for tuple in regexall("(.*)=(.*)", file("./.env")) : tuple[0] => tuple[1] }
}

module "markitos_aws_ec2_ssh_https_ssh_https" {
  source                                   = "../../markitos.aws.ec2.ssh.https"
  markitos_aws_ec2_ssh_https_ami_image     = "ami-0694d931cee176e7d"
  markitos_aws_ec2_ssh_https_instance_type = "t2.micro"
  markitos_aws_ec2_ssh_https_user_data     = <<-EOF
    #!/bin/bash
    yum update && yum install -y httpd && \
    systemctl enable httpd && \
    systemctl start httpd && \
    echo '<h1>hola</h1>' > /var/www/html/index.html
    EOF
}
