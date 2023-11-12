variable "markitos_aws_vpc_project_name" {
  description = "used as prefix name for all created blocks, only letters 3-20 chars"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{3,20}$", var.markitos_aws_vpc_project_name))
    error_message = "only letters between 3-20 chars"
  }
}

variable "markitos_aws_vpc_common_tags" {
  description = "common tags for all resources"
  type        = map(string)
  nullable    = false
  default = {
    Author = "markitos"
    Email  = "markitos.info@gmail.com"
  }
}

variable "markitos_aws_vpc_map_public_ip_on_launch" {
  description = "map_public_ip_on_launch, default, true"
  type        = bool
  default     = true
}

variable "markitos_aws_vpc_az" {
  description = "network az"
  type        = string
  nullable    = false
  default     = "eu-west-1a"
}

variable "markitos_aws_vpc_subnet_cidr_block" {
  description = "public subnet cidr block, default 10.0.1.0/24"
  type        = string
  nullable    = false
  default     = "10.0.1.0/24"
}

variable "markitos_aws_vpc_subnets" {
  type = list(object({
    markitos_aws_vpc_subnet_cidr_block       = string
    markitos_aws_vpc_map_public_ip_on_launch = bool
    markitos_aws_vpc_az                      = string
  }))
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.vpc"
  }
  markitos_aws_vpc_default_vpc_cidr_block           = "10.0.0.0/16"
  markitos_aws_vpc_default_public_subnet_cidr_block = "10.0.1.0/24"
}
