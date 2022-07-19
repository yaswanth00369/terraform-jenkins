provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {
    bucket = "jenkins1-tfstate-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Game-Scores"
  }
} 

/* 
resource "aws_s3_bucket" "example" {
  bucket = "jenkins1-tfstate-bucket"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
} 




resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "Game-Scores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}  */

