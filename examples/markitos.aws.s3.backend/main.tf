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

module "markitos_aws_s3_backend" {
  source                                    = "../../markitos.aws.s3.backend"
  markitos_aws_s3_backend_env_file          = "./.env"
  project_name                              = "markitos_terramods"
  markitos_aws_s3_backend_s3_region         = "eu-west-1"
  markitos_aws_s3_backend_s3_bucket_encrypt = true
  markitos_aws_s3_backend_s3_bucket_key     = "markitos-terramods/terraform/states"
  markitos_aws_s3_backend_s3_bucket_id      = "markitos-terramods.terraform.state"
  markitos_aws_s3_backend_dynamodb_table    = "markitos-terramods-main-terraform-lock"
}
