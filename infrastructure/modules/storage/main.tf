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

# File bucket

resource "aws_s3_bucket" "file-bucket" {
  bucket = "${var.APP_NAME}-files-${var.STAGE}"

  tags = {
    Name = "${var.APP_NAME}-files-${var.STAGE}"
  }
}
