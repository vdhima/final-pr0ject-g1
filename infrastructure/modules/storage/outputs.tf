output "web-client-domain-name" {
  value = aws_s3_bucket.my-static-website.bucket_domain_name
}

output "web-client-bucket-name" {
  value = aws_s3_bucket.my-static-website.id
}

output "web-client-website-domain" {
  value = aws_s3_bucket_website_configuration.my-static-website-config.website_domain
}
