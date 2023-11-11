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

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.ec2"
  }
}

