# Client web

resource "aws_s3_bucket" "web-client-bucket" {
  bucket        = "${var.APP_NAME}-${var.STAGE}"
  force_destroy = true

  tags = {
    Name = "${var.APP_NAME}-web-client-${var.STAGE}"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_website_configuration" "web-client-website" {
  bucket = aws_s3_bucket.web-client-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_acl" "web-client-bucket-acl" {
  bucket = aws_s3_bucket.web-client-bucket.id

  acl = "public-read"
}

resource "aws_s3_bucket_policy" "web-client-bucket-policy" {
  bucket = aws_s3_bucket.web-client-bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = ["${aws_s3_bucket.web-client-bucket.arn}/*"]
      },
    ]
  })
}

# File bucket

resource "aws_s3_bucket" "file-bucket" {
  bucket = "${var.APP_NAME}-files-${var.STAGE}"

  tags = {
    Name = "${var.APP_NAME}-files-${var.STAGE}"
  }
}

resource "aws_s3_bucket_acl" "file-bucket-policy" {
  bucket = aws_s3_bucket.file-bucket.id
  acl    = "private"
}
