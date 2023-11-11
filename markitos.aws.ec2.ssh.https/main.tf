resource "aws_vpc" "markitos_aws_ec2_ssh_https_vpc" {
  cidr_block = local.markitos_aws_ec2_ssh_https_default_vpc_cidr_block

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ec2_ssh_https_project_name}-markitos_aws_ec2_ssh_https_vpc"
  }))
}
resource "aws_subnet" "markitos_aws_ec2_ssh_https_public_subnet" {
  vpc_id                  = aws_vpc.markitos_aws_ec2_ssh_https_vpc.id
  cidr_block              = local.markitos_aws_ec2_ssh_https_default_public_subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.markitos_aws_ec2_ssh_https_az
  depends_on              = [aws_vpc.markitos_aws_ec2_ssh_https_vpc]

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ec2_ssh_https_project_name}-markitos_aws_ec2_ssh_https_public_subnets"
  }))
}

resource "aws_security_group" "markitos_aws_ec2_ssh_https_security_group" {
  name        = "allow ssh http/s access"
  description = "Allow ssh http/s inbound traffic"
  vpc_id      = aws_vpc.markitos_aws_ec2_ssh_https_vpc.id
  depends_on  = [aws_vpc.markitos_aws_ec2_ssh_https_vpc]

  dynamic "ingress" {
    for_each = local.markitos_aws_ec2_ssh_https_default_web_ports
    content {
      description = "markitos_aws_ec2_ssh_https_security_group Traffic from internet"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ec2_ssh_https_project_name}-markitos_aws_ec2_ssh_https_security_group"
  }))
}

resource "aws_instance" "markitos_aws_ec2_ssh_https_instance" {
  ami                    = var.markitos_aws_ec2_ssh_https_ami_image
  instance_type          = var.markitos_aws_ec2_ssh_https_instance_type
  availability_zone      = var.markitos_aws_ec2_ssh_https_az
  user_data              = var.markitos_aws_ec2_ssh_https_user_data
  vpc_security_group_ids = [aws_security_group.markitos_aws_ec2_ssh_https_security_group.id]
  subnet_id              = aws_subnet.markitos_aws_ec2_ssh_https_public_subnet.id
  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ec2_ssh_https_project_name}-markitos_aws_ec2_ssh_https_security_group"
  }))
}
