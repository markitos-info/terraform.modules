output "markitos_aws_asg_template_output_asg_arn" {
  description = "asg arn"
  value       = aws_autoscaling_group.markitos_aws_asg_template_aws_autoscaling_group.arn
}

output "markitos_aws_asg_template_output_asg_id" {
  description = "asg id"
  value       = aws_autoscaling_group.markitos_aws_asg_template_aws_autoscaling_group.id
}

output "markitos_aws_asg_template_output_vpc_zone_identifier_ids" {
  description = "asg vpc_zone_identifier"
  value       = values(aws_autoscaling_group.markitos_aws_asg_template_aws_autoscaling_group)[*].id
}
