resource "aws_security_group" "markitos_aws_security_group" {
  name        = "markitos_aws_security_group allow access"
  description = "markitos_aws_security_group Allow inbound traffic"
  vpc_id      = var.markitos_aws_security_group_vpc_id

  dynamic "ingress" {
    for_each = toset(var.markitos_aws_security_group_ports)
    content {
      description = "markitos_aws_security_group ingress port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "markitos_aws_security_group egress all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = (merge(local.tags, {
    Name = "markitos_aws_security_group"
  }))
}
