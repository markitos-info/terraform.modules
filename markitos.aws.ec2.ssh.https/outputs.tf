output "markitos_aws_ec2_ssh_https_project_name_output_var" {
  value = var.markitos_aws_ec2_ssh_https_project_name
}

output "markitos_aws_ec2_ssh_https_output_public_ip" {
  value = aws_instance.markitos_aws_ec2_ssh_https_instance.public_ip
}
