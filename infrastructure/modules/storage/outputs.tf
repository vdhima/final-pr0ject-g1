output "web-client-domain-name" {
  value = aws_s3_bucket.web-client-bucket.bucket_domain_name
}

output "web-client-bucket-name" {
  value = aws_s3_bucket.web-client-bucket.id
}

output "web-client-website-domain" {
  value = aws_s3_bucket_website_configuration.web-client-website.website_domain
}
