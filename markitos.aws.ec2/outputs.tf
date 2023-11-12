output "markitos_aws_ec2_public_id" {
  value = aws_instance.markitos_aws_ec2.public_ip
}

output "markitos_aws_ec2_id" {
  value = aws_instance.markitos_aws_ec2.id
}

output "markitos_aws_ec2_arn" {
  value = aws_instance.markitos_aws_ec2.arn
}
