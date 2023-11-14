variable "markitos_aws_asg_template_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_asg_template_project_name))
    error_message = "only letters between 3-20 chars"
  }
}

variable "markitos_aws_asg_template_desired_capacity" {
  description = "aws_autoscaling_group desired capacity, default 2"
  type        = number
  nullable    = false
  default     = 2
}

variable "markitos_aws_asg_template_max_size" {
  description = "aws_autoscaling_group maximum capacity, default 3"
  type        = number
  nullable    = false
  default     = 3
}

variable "markitos_aws_asg_template_min_size" {
  description = "aws_autoscaling_group minimum capacity, default 1"
  type        = number
  nullable    = false
  default     = 1
}

variable "markitos_aws_asg_template_launch_template_id" {
  description = "aws_autoscaling_group launch template id"
  type        = string
  nullable    = false
}

variable "markitos_aws_asg_template_subnets" {
  type = list(object({
    markitos_aws_asg_template_subnet_cidr_block       = string
    markitos_aws_asg_template_map_public_ip_on_launch = bool
    markitos_aws_asg_template_az                      = string
  }))
}

variable "markitos_aws_asg_template_vpc_zone_identifier_ids" {
  type = set(string)
}
