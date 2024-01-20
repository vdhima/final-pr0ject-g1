output "main-vpc-id" {
  value = aws_vpc.main.id
}

output "public-subnet-ids" {
  value = [
    for subnet in aws_subnet.main-public-subnets : subnet.id
  ]
}

output "private-subnet-ids" {
  value = [
    for subnet in aws_subnet.main-private-subnets : subnet.id
  ]
}
