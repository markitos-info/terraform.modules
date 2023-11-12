variable "markitos_aws_security_group_vpc_id" {
  type        = string
  description = "vpc id"
}

locals {
  markitos_aws_security_group_web_ports = toset([80, 22, 443])
  tags = {
    Author = "Marco Antonio - markitos"
    Module = "markitos.aws.security.group"
  }
}
