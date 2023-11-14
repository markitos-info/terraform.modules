#:{.".}>--- general outputs --
output "markitos_aws_public_subnet_igw_output_total_subnets" {
  value = length(var.markitos_aws_public_subnet_igw_subnets)
}
output "markitos_aws_public_subnet_igw_output_subnets" {
  value = var.markitos_aws_public_subnet_igw_subnets
}
#:{.".}>----------------------

#:{.".}>--- vpc outputs ------
output "markitos_aws_public_subnet_igw_project_name_output_var" {
  value = var.markitos_aws_public_subnet_igw_project_name
}
output "markitos_aws_public_subnet_igw_output_vpc_id" {
  value = aws_vpc.markitos_aws_public_subnet_igw_vpc.id
}
output "markitos_aws_public_subnet_igw_output_vpc_arn" {
  value = aws_vpc.markitos_aws_public_subnet_igw_vpc.arn
}
#:{.".}>----------------------

#:{.".}>--- subnet outputs ---
output "markitos_aws_public_subnet_igw_markitos_aws_public_subnet_igw_subnets_ids_output" {
  value = aws_subnet.markitos_aws_public_subnet_igw_subnet[*].id
}
#:{.".}>----------------------

