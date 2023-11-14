variable "markitos_aws_alb_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_alb_project_name))
    error_message = "only letters between 3-20 chars"
  }
}

variable "markitos_aws_alb_aws_lb_listener_port" {
  description = "alb load balancer listener port, default 80"
  type        = number
  nullable    = false
  default     = 80
}

variable "markitos_aws_alb_aws_lb_target_group_port" {
  description = "alb load balancer target group port, default 80"
  type        = number
  nullable    = false
  default     = 80
}

variable "markitos_aws_alb_vpc_id" {
  type        = string
  description = "vpc id for alb load balancer"
}

variable "markitos_aws_alb_security_groups_ids" {
  type        = set(string)
  description = "all security groups ids for alb"
}

variable "markitos_aws_alb_subnets_ids" {
  type        = set(string)
  description = "all subnet ids for vpc"
}

variable "markitos_aws_alb_subnets" {
  type = list(object({
    markitos_aws_vpc_subnet_cidr_block       = string
    markitos_aws_vpc_map_public_ip_on_launch = bool
    markitos_aws_vpc_az                      = string
  }))
  description = "list of subnets for vpc"
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.alb"
  }
}
