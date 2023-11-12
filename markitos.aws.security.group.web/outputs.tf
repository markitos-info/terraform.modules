output "markitos_aws_security_group_web_output_arn" {
  description = "created arn for security group"
  value       = aws_security_group.markitos_aws_security_group_web.arn
}

output "markitos_aws_security_group_web_output_id" {
  description = "created id for security group"
  value       = aws_security_group.markitos_aws_security_group_web.id
}

output "markitos_aws_security_group_web_output_ports" {
  description = "ports"
  value       = local.markitos_aws_security_group_web_ports
}
