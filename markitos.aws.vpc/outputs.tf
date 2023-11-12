#:{.".}>--- general outputs --
output "markitos_aws_vpc_output_total_subnets" {
  value = length(var.markitos_aws_vpc_subnets)
}
output "markitos_aws_vpc_output_subnets" {
  value = var.markitos_aws_vpc_subnets
}
#:{.".}>----------------------

#:{.".}>--- vpc outputs ------
output "markitos_aws_vpc_project_name_output_var" {
  value = var.markitos_aws_vpc_project_name
}
output "markitos_aws_vpc_output_vpc_id" {
  value = aws_vpc.markitos_aws_vpc_vpc.id
}
output "markitos_aws_vpc_output_vpc_arn" {
  value = aws_vpc.markitos_aws_vpc_vpc.arn
}
#:{.".}>----------------------

#:{.".}>--- subnet outputs ---
output "markitos_aws_vpc_markitos_aws_vpc_subnets_output" {
  value = aws_subnet.markitos_aws_vpc_subnet
}
#:{.".}>----------------------

