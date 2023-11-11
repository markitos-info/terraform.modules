resource "aws_s3_bucket" "markitos_aws_s3_backend_bucket" {
  bucket = var.markitos_aws_s3_backend_s3_bucket_id

  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "markitos_aws_s3_backend_bucket_version" {
  bucket = var.markitos_aws_s3_backend_s3_bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "markitos_aws_s3_backend_bucket_encryption_configuration" {
  bucket = var.markitos_aws_s3_backend_s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "markitos_aws_s3_backend_bucket_version_database" {
  name           = var.markitos_aws_s3_backend_dynamodb_table
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

