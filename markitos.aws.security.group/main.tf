resource "aws_security_group" "markitos_aws_security_group_ssh_http_https" {
  name        = "markitos_aws_security_group_ssh_http_https allow ssh http/s access"
  description = "markitos_aws_security_group_ssh_http_https Allow ssh http/s inbound traffic"
  vpc_id      = var.markitos_aws_security_group_vpc_id

  dynamic "ingress" {
    for_each = local.markitos_aws_security_group_ports
    content {
      description = "markitos_aws_security_group_ssh_http_https ingress port ${each.value}"
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
    Name = "markitos_aws_security_group_ssh_http_https"
  }))
}
