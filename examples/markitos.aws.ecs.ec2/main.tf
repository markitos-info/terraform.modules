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

  subnets_igw = [
    {
      description                                            = "markitos.aws.vpc.example.subnet.public.description"
      markitos_aws_public_subnet_igw_az                      = "eu-west-1a"
      markitos_aws_public_subnet_igw_subnet_cidr_block       = "10.0.1.0/24"
      markitos_aws_public_subnet_igw_map_public_ip_on_launch = true
    },
    {
      description                                            = "markitos.aws.vpc.example.subnet.private.description"
      markitos_aws_public_subnet_igw_az                      = "eu-west-1b"
      markitos_aws_public_subnet_igw_subnet_cidr_block       = "10.0.2.0/24"
      markitos_aws_public_subnet_igw_map_public_ip_on_launch = false
    }
  ]
  subnets_alb = [
    {
      description                              = "markitos.aws.vpc.example.subnet.public.description"
      markitos_aws_vpc_az                      = "eu-west-1a"
      markitos_aws_vpc_subnet_cidr_block       = "10.0.1.0/24"
      markitos_aws_vpc_map_public_ip_on_launch = true
    },
    {
      description                              = "markitos.aws.vpc.example.subnet.private.description"
      markitos_aws_vpc_az                      = "eu-west-1b"
      markitos_aws_vpc_subnet_cidr_block       = "10.0.2.0/24"
      markitos_aws_vpc_map_public_ip_on_launch = false
    }
  ]
}

module "markitos_aws_public_subnet_igw" {
  source = "../../markitos.aws.public.subnet.igw"

  markitos_aws_public_subnet_igw_project_name = "markitos_terramods"
  markitos_aws_public_subnet_igw_subnets      = local.subnets_igw
}

module "markitos_aws_security_group_web" {
  source                             = "../../markitos.aws.security.group.web"
  markitos_aws_security_group_vpc_id = module.markitos_aws_public_subnet_igw.markitos_aws_public_subnet_igw_output_vpc_id
}

module "markitos_aws_alb" {
  source = "../../markitos.aws.alb"

  markitos_aws_alb_project_name        = "markitos_terramods"
  markitos_aws_alb_subnets             = local.subnets_alb
  markitos_aws_alb_vpc_id              = module.markitos_aws_public_subnet_igw.markitos_aws_public_subnet_igw_output_vpc_id
  markitos_aws_alb_subnets_ids         = module.markitos_aws_public_subnet_igw.markitos_aws_public_subnet_igw_markitos_aws_public_subnet_igw_subnets_ids_output
  markitos_aws_alb_security_groups_ids = [module.markitos_aws_security_group_web.markitos_aws_security_group_web_output_id]

  depends_on = [module.markitos_aws_public_subnet_igw, module.markitos_aws_security_group_web]
}

module "markitos_aws_ecs_ec2" {
  source                                  = "../../markitos.aws.ecs.ec2"
  markitos_aws_ecs_ec2_project_name       = "projectecsecdos"
  markitos_aws_ecs_ec2_security_group_ids = [module.markitos_aws_security_group_web.markitos_aws_security_group_web_output_id]
  markitos_aws_ecs_ec2_subnets            = local.subnets_alb
  markitos_aws_ecs_ec2_subnets_ids        = module.markitos_aws_public_subnet_igw.markitos_aws_public_subnet_igw_markitos_aws_public_subnet_igw_subnets_ids_output
}
