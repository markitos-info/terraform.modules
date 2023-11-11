output "markitos_aws_s3_bucket_names_output_arns" {
  description = "list of created s3 buckets arn"
  value       = [for aws_s3_bucket in aws_s3_bucket.markitos_aws_s3_bucket : aws_s3_bucket.arn]
}
