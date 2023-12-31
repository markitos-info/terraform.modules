variable "markitos_aws_security_group_vpc_id" {
  type        = string
  description = "vpc id"
}

variable "markitos_aws_security_group_ports" {
  type        = set(number)
  description = "list of ports"
}

locals {
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.security.group"
  }
}
