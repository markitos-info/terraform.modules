variable "project_name" {
  description = "Project name, use for suffix/preffix"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{1,}[aA-zZ,0-9,_]{1,}[aA-zZ]{1}$", var.project_name))
    error_message = "invalid title, start with letter, then, letters number, 3-25 chars length"
  }
}

variable "markitos_aws_internet_gateway_vpc_id" {
  type        = string
  description = "vpc id for internet gateway"
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.security.group"
  }
}
