variable "APP_NAME" {
  type = string
}

variable "STAGE" {
  type = string
}

variable "AWS_REGION" {
  type = string
}

variable "PUBLIC_SUBNETS" {
  default = {
    "a" = 1
    "b" = 2
  }
}

variable "PRIVATE_SUBNETS" {
  default = {
    "a" = 3
    "b" = 4
  }
}
