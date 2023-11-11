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

module "markitos_aws_ec2" {
  source                         = "../../markitos.aws.ec2"
  markitos_aws_ec2_ami_image     = "ami-0e309a5f3a6dd97ea"
  markitos_aws_ec2_instance_type = "t2.micro"
}
