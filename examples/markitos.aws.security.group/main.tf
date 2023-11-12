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
  subnets = [
    {
      description                              = "markitos.aws.vpc.example.subnet.public.description"
      markitos_aws_vpc_az                      = "eu-west-1a"
      markitos_aws_vpc_subnet_cidr_block       = "10.0.1.0/24"
      markitos_aws_vpc_map_public_ip_on_launch = true
    }
  ]
}

module "markitos_aws_vpc" {
  source = "../../markitos.aws.vpc"

  markitos_aws_vpc_project_name = "markitos_terramods"
  markitos_aws_vpc_subnets      = local.subnets
}

module "markitos_aws_security_group" {
  source                             = "../../markitos.aws.security.group"
  markitos_aws_security_group_vpc_id = module.markitos_aws_vpc.markitos_aws_vpc_output_vpc_id
  markitos_aws_security_group_ports  = [1, 2, 3]
}
