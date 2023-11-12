variable "markitos_aws_ecs_ec2_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_ecs_ec2_project_name))
    error_message = "only letters between 3-20 chars"
  }
}
variable "markitos_aws_ecs_ec2_launch_template_name_prefix" {
  description = "used as prefix for ecs service"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{1,}[aA-zZ,0-9,_]{2,48}[aA-zZ]{1}$", var.markitos_aws_ecs_ec2_launch_template_name_prefix))
    error_message = "only letters between 3-50 chars, start with letter and can contain _"
  }
}
variable "markitos_aws_ecs_ec2_launch_template_image_id" {
  description = "image id"
  type        = string
  nullable    = false
}

variable "markitos_aws_ecs_ec2_launch_template_instance_type" {
  description = "ec2 instance type"
  type        = string
  nullable    = false
}

variable "markitos_aws_ecs_ec2_vpc_security_group_ids" {
  description = "ecs ec2 security group ids"
  type        = set(string)
  nullable    = false
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.security.group"
  }
}
