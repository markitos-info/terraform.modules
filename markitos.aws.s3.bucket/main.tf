#:--------------------------------------------------------
resource "aws_s3_bucket" "markitos_aws_s3_bucket" {
  for_each = var.markitos_aws_s3_bucket_names
  bucket   = each.value
  tags = {
    Name = each.value
  }
}
#:--------------------------------------------------------
