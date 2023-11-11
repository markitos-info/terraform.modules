variable "markitos_aws_ec2_ssh_https_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_ec2_ssh_https_project_name))
    error_message = "only letters between 3-20 chars"
  }
}

variable "markitos_aws_ec2_ssh_https_common_tags" {
  description = "common tags for all resources"
  type        = map(string)
  nullable    = false
  default = {
    Author = "markitos"
    Email  = "markitos.info@gmail.com"
  }
}

variable "markitos_aws_ec2_ssh_https_ami_image" {
  description = "ec2 ami image"
  type        = string
  nullable    = false
}

variable "markitos_aws_ec2_ssh_https_instance_type" {
  description = "ec2 instance type"
  type        = string
  nullable    = false
}

variable "markitos_aws_ec2_ssh_https_user_data" {
  description = "ec2 user data for first boot"
  type        = string
  nullable    = false
}

variable "markitos_aws_ec2_ssh_https_az" {
  description = "network az"
  type        = string
  nullable    = false
  default     = "eu-west-1a"
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.ec2"
  }
  markitos_aws_ec2_ssh_https_default_vpc_cidr_block           = "10.10.0.0/16"
  markitos_aws_ec2_ssh_https_default_public_subnet_cidr_block = "10.10.1.0/24"
  markitos_aws_ec2_ssh_https_default_web_ports                = toset([80, 443, 22])
}

