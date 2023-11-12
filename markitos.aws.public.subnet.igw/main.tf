resource "aws_vpc" "markitos_aws_public_subnet_igw_vpc" {
  cidr_block           = local.markitos_aws_public_subnet_igw_default_vpc_cidr_block
  enable_dns_hostnames = true

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_public_subnet_igw_project_name}-markitos_aws_public_subnet_igw_vpc"
  }))
}

resource "aws_subnet" "markitos_aws_public_subnet_igw_subnet" {
  count = length(var.markitos_aws_public_subnet_igw_subnets)

  vpc_id                  = aws_vpc.markitos_aws_public_subnet_igw_vpc.id
  depends_on              = [aws_vpc.markitos_aws_public_subnet_igw_vpc]
  cidr_block              = var.markitos_aws_public_subnet_igw_subnets[count.index].markitos_aws_public_subnet_igw_subnet_cidr_block
  map_public_ip_on_launch = var.markitos_aws_public_subnet_igw_subnets[count.index].markitos_aws_public_subnet_igw_map_public_ip_on_launch
  availability_zone       = var.markitos_aws_public_subnet_igw_subnets[count.index].markitos_aws_public_subnet_igw_az

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_public_subnet_igw_project_name}-markitos_aws_public_subnet_igw_subnet-${count.index + 1}"
  }))
}

resource "aws_internet_gateway" "markitos_aws_public_subnet_igw_internet_gateway" {
  vpc_id     = aws_vpc.markitos_aws_public_subnet_igw_vpc.id
  depends_on = [aws_vpc.markitos_aws_public_subnet_igw_vpc]

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_public_subnet_igw_project_name}-markitos_aws_public_subnet_igw_internet_gateway"
  }))
}

resource "aws_route_table" "markitos_aws_public_subnet_igw_route_table" {
  vpc_id = aws_vpc.markitos_aws_public_subnet_igw_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.markitos_aws_public_subnet_igw_internet_gateway.id
  }

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_public_subnet_igw_project_name}-markitos_aws_public_subnet_igw_route_table"
  }))
}

resource "aws_route_table_association" "markitos_aws_public_subnet_igw_subnet_route" {
  count = length(var.markitos_aws_public_subnet_igw_subnets)

  subnet_id      = aws_subnet.markitos_aws_public_subnet_igw_subnet[count.index].id
  route_table_id = aws_route_table.markitos_aws_public_subnet_igw_route_table.id
}

