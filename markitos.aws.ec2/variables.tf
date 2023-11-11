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

variable "markitos_aws_ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
  nullable    = false
}

