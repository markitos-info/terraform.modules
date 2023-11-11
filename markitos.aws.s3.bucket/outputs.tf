output "output_aws_s3_bucket_from_module_arn" {
  description = "list of created s3 buckets arn"
  value       = [for aws_s3_bucket in aws_s3_bucket.aws_s3_bucket_from_module : aws_s3_bucket.arn]
}
