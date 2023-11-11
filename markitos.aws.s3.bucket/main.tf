#:--------------------------------------------------------
resource "aws_s3_bucket" "aws_s3_bucket_from_module" {
  for_each = var.bucket_names
  bucket   = each.value
  tags = {
    Name = each.value
  }
}
#:--------------------------------------------------------
