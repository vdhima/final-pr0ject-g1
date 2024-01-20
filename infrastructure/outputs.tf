output "DB_ADDRESS" {
  value = module.database.db-address
}

output "DB_PORT" {
  value = module.database.db-port
}

output "DB_USERNAME" {
  value = var.DB_USERNAME
}

output "DB_PASSWORD" {
  value = var.DB_PASSWORD
}

output "DB_NAME" {
  value = var.DB_NAME
}

output "WEB_CLIENT_BUCKET_NAME" {
  value = module.storage.web-client-bucket-name
}

output "WEB_CLIENT_DOMAIN" {
  value = module.storage.web-client-website-domain
}

output "ECR_REPOSITORY_NAME" {
  value = module.cluster.ecr-repository-name
}
