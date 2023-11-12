variable "markitos_aws_ec2_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_ec2_project_name))
    error_message = "only letters between 3-20 chars"
  }
}

variable "markitos_aws_ec2_common_tags" {
  description = "common tags for all resources"
  type        = map(string)
  nullable    = false
  default = {
    Author = "markitos"
    Email  = "markitos.info@gmail.com"
  }
}

variable "markitos_aws_ec2_ami_image" {
  description = "ec2 ami image"
  type        = string
  nullable    = false
}

variable "markitos_aws_ec2_type" {
  description = "ec2 instance type"
  type        = string
  nullable    = false
}

variable "markitos_aws_ec2_user_data" {
  description = "optionally, ec2 user data for first boot"
  type        = string
  default     = ""
}

variable "markitos_aws_ec2_az" {
  description = "network az"
  type        = string
  nullable    = false
  default     = "eu-west-1a"
}

variable "markitos_aws_ec2_vpc_security_group_ids" {
  description = "list of security groups"
  type        = list(string)
  nullable    = false
}

variable "markitos_aws_ec2_subnet_id" {
  description = "subnet id"
  type        = string
  nullable    = false
}

locals {
  markitos_aws_ec2_tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.ec2"
  }
}

