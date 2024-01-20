variable "AWS_ACCESS_KEY_ID" {
  type    = string
  default = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  type    = string
  default = ""
}

variable "AWS_REGION" {
  type        = string
  default     = "eu-north-1"
  description = "Stockholm"
}

variable "APP_NAME" {
  type    = string
  default = "final-project-g1"
}

variable "STAGE" {
  type    = string
  default = "production"
}

variable "DB_USERNAME" {
  default = ""
}

variable "DB_PASSWORD" {
  default = ""
}

variable "DB_NAME" {
  default = ""
}
