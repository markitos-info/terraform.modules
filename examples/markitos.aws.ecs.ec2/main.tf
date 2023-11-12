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
      description                              = "markitos.aws.ecs.ec2.example.subnet.public.description"
      markitos_aws_vpc_az                      = "eu-west-1a"
      markitos_aws_vpc_subnet_cidr_block       = "10.0.1.0/24"
      markitos_aws_vpc_map_public_ip_on_launch = true
    }
  ]
}

module "markitos_aws_vpc" {
  source = "../../markitos.aws.vpc"

  markitos_aws_vpc_project_name = "projectecsecdos"
  markitos_aws_vpc_subnets      = local.subnets
}

module "markitos_aws_security_group_web" {
  source                             = "../../markitos.aws.security.group.web"
  markitos_aws_security_group_vpc_id = module.markitos_aws_vpc.markitos_aws_vpc_output_vpc_id
}

module "markitos_aws_ecs_ec2" {
  source                                             = "../../markitos.aws.ecs.ec2"
  markitos_aws_ecs_ec2_project_name                  = "projectecsecdos"
  markitos_aws_ecs_ec2_launch_template_name_prefix   = "markitos_aws_ecs_ec2_template_prefix"
  markitos_aws_ecs_ec2_launch_template_image_id      = "ami-062c116e449466e7f"
  markitos_aws_ecs_ec2_launch_template_instance_type = "t2.micro"
  markitos_aws_ecs_ec2_vpc_security_group_ids        = [module.markitos_aws_security_group_web.markitos_aws_security_group_web_output_id]
}
