# VPC

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.APP_NAME}-vpc-${var.STAGE}"
  }
}

# Subnets

resource "aws_subnet" "main-public-subnets" {
  for_each = var.PUBLIC_SUBNETS

  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${var.AWS_REGION}${each.key}"
  cidr_block              = "10.0.${each.value}.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.APP_NAME}-subnet-${each.value}-${var.STAGE}"
  }
}

resource "aws_subnet" "main-private-subnets" {
  for_each = var.PRIVATE_SUBNETS

  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${var.AWS_REGION}${each.key}"
  cidr_block              = "10.0.${each.value}.0/24"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "${var.APP_NAME}-subnet-${each.value}-${var.STAGE}"
  }
}

# Internet gateway

resource "aws_internet_gateway" "main-gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.APP_NAME}-vpc-gateway-${var.STAGE}"
  }
}

resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gateway.id
  }

  tags = {
    Name = "${var.APP_NAME}-main-route-table-${var.STAGE}"
  }
}

resource "aws_route_table_association" "table-association" {
  for_each = aws_subnet.main-public-subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.main-route-table.id
}
