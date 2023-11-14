variable "markitos_aws_ecs_ec2_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_ecs_ec2_project_name))
    error_message = "only letters between 3-20 chars"
  }
}
# variable "markitos_aws_ecs_ec2_lb_target_group_arn" {
#   description = "target group for load balancer for aws ecs service"
#   type        = string
#   nullable    = false
# }

variable "markitos_aws_ecs_ec2_security_group_ids" {
  description = "list of security groups"
  type        = set(string)
  nullable    = false
}

variable "markitos_aws_ecs_ec2_subnets_ids" {
  description = "list of subnets ids"
  type        = set(string)
  nullable    = false
}


variable "markitos_aws_ecs_ec2_subnets" {
  description = "list of subnets for vpc"
  type = list(object({
    markitos_aws_vpc_subnet_cidr_block       = string
    markitos_aws_vpc_map_public_ip_on_launch = bool
    markitos_aws_vpc_az                      = string
  }))
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.ecs.ec2"
  }
}
