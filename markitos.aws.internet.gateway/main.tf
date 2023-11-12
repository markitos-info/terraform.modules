resource "aws_internet_gateway" "markitos_aws_internet_gateway" {
  vpc_id = var.markitos_aws_internet_gateway_vpc_id

  tags = (merge(local.tags, {
    Name = "${var.project_name}-markitos_aws_internet_gateway"
  }))
}
