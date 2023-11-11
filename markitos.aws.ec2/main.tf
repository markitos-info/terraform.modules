resource "aws_instance" "aws_instance_markitos_module" {
  ami           = var.markitos_aws_ec2_ami_image
  instance_type = var.markitos_aws_ec2_instance_type
  tags          = var.markitos_aws_ec2_common_tags
}
