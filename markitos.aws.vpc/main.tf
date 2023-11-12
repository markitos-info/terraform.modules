resource "aws_vpc" "markitos_aws_vpc_vpc" {
  cidr_block = local.markitos_aws_vpc_default_vpc_cidr_block

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_vpc_project_name}-markitos_aws_vpc_vpc"
  }))
}

resource "aws_subnet" "markitos_aws_vpc_subnet" {
  count = length(var.markitos_aws_vpc_subnets)

  vpc_id                  = aws_vpc.markitos_aws_vpc_vpc.id
  depends_on              = [aws_vpc.markitos_aws_vpc_vpc]
  cidr_block              = var.markitos_aws_vpc_subnets[count.index].markitos_aws_vpc_subnet_cidr_block
  map_public_ip_on_launch = var.markitos_aws_vpc_subnets[count.index].markitos_aws_vpc_map_public_ip_on_launch
  availability_zone       = var.markitos_aws_vpc_subnets[count.index].markitos_aws_vpc_az

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_vpc_project_name}-markitos_aws_vpc_subnet-${count.index + 1}"
  }))
}
