output "markitos_aws_security_group_output_arn" {
  description = "created arn for security group"
  value       = aws_security_group.markitos_aws_security_group_ssh_http_https.arn
}
output "markitos_aws_security_group_output_id" {
  description = "created id for security group"
  value       = aws_security_group.markitos_aws_security_group_ssh_http_https.id
}
