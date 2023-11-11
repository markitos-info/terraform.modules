resource "aws_s3_bucket" "aws_s3_bucket_markitos_backend" {
  bucket = var.backend_s3_bucket_id

  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning_markitos_backend" {
  bucket = var.backend_s3_bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_s3_bucket_server_side_encryption_configuration_markitos_backend" {
  bucket = var.backend_s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "aws_dynamodb_table_markitos_backend" {
  name           = var.backend_dynamodb_table
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

