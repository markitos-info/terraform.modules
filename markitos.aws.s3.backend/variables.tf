variable "project_name" {
  description = "Project name, use for suffix/preffix"
  type        = string
  nullable    = false
  validation {
    condition     = can(regex("^[aA-zZ]{1,}[aA-zZ,0-9,_]{1,}[aA-zZ]{1}$", var.project_name))
    error_message = "invalid title, start with letter, then, letters number, 3-25 chars length"
  }
}

variable "backend_env_file" {
  description = "Local absolute path to .env file with sensible data"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "backend_s3_region" {
  description = "S3 object region where store remote backend state"
  type        = string
  nullable    = false
}

variable "backend_s3_bucket_encrypt" {
  description = "S3 object encrypt flag"
  type        = bool
  nullable    = false
}

variable "backend_s3_bucket_key" {
  description = "S3 object path/key where store remote backend state"
  type        = string
  nullable    = false
}

variable "backend_s3_bucket_id" {
  description = "S3 object where store remote backend state"
  type        = string
  nullable    = false
}

variable "backend_dynamodb_table" {
  description = "DynaoDB table for state lock"
  type        = string
  nullable    = false
}
