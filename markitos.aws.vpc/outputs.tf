output "markitos_aws_vpc_output_total_subnets" {
  value = length(var.markitos_aws_vpc_subnets)
}
output "markitos_aws_vpc_output_vpc_id" {
  value = aws_vpc.markitos_aws_vpc_vpc.id
}
output "markitos_aws_vpc_output_vpc_arn" {
  value = aws_vpc.markitos_aws_vpc_vpc.arn
}
output "markitos_aws_vpc_subnets_output_ids" {
  value = aws_subnet.markitos_aws_vpc_subnet[*].id
}
