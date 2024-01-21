terraform {
    required_version = ">= 0.12"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
provider "aws" {
    region = "eu-north-1"
}
resource "aws_s3_bucket" "my-static-website" {
  bucket        = "gh-090124"
  force_destroy = true
  tags = {
    Name = "gh-090124"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_s3_bucket_website_configuration" "my-static-website-config" {
  bucket = aws_s3_bucket.my-static-website.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}
resource "aws_s3_bucket_ownership_controls" "my-static-website-controls" {
  bucket = aws_s3_bucket.my-static-website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "my-static-website-access-block" {
  bucket = aws_s3_bucket.my-static-website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "my-static-website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my-static-website-controls,
    aws_s3_bucket_public_access_block.my-static-website-access-block,
  ]
  bucket = aws_s3_bucket.my-static-website.id
  acl    = "public-read"
}
resource "aws_s3_bucket_policy" "my-static-website-policy" {
  bucket = aws_s3_bucket.my-static-website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = ["${aws_s3_bucket.my-static-website.arn}/*"]
      },
    ]
  })
  depends_on = [ aws_s3_bucket.my-static-website , aws_s3_bucket_public_access_block.my-static-website-access-block ]
