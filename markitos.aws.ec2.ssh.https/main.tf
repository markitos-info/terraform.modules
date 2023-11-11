resource "aws_security_group" "markitos_aws_ec2_ssh_https_security_group" {
  name        = "allow ssh http/s access"
  description = "Allow ssh http/s inbound traffic"

  dynamic "ingress" {
    for_each = toset([80, 443, 22])
    content {
      description = "markitos_aws_ec2_ssh_https_security_group Traffic from internet"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = (merge(local.tags, {
    Service = "aws_security_group"
    Target  = "markitos_aws_ec2_ssh_https_security_group"
  }))
}

resource "aws_instance" "markitos_aws_ec2_ssh_https_instance" {
  ami                    = var.markitos_aws_ec2_ssh_https_ami_image
  instance_type          = var.markitos_aws_ec2_ssh_https_instance_type
  tags                   = var.markitos_aws_ec2_ssh_https_common_tags
  user_data              = var.markitos_aws_ec2_ssh_https_user_data
  vpc_security_group_ids = [aws_security_group.markitos_aws_ec2_ssh_https_security_group.id]
}
