resource "aws_instance" "markitos_aws_ec2" {
  ami                    = var.markitos_aws_ec2_ami_image
  instance_type          = var.markitos_aws_ec2_type
  availability_zone      = var.markitos_aws_ec2_az
  user_data              = var.markitos_aws_ec2_user_data
  vpc_security_group_ids = var.markitos_aws_ec2_vpc_security_group_ids
  subnet_id              = var.markitos_aws_ec2_subnet_id

  tags = (merge(local.markitos_aws_ec2_tags, {
    Name = "${var.markitos_aws_ec2_project_name}-markitos_aws_ec2"
  }))
}
